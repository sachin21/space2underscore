# frozen_string_literal: true

module Space2underscore
  class Cli
    CREATE_FLAGS = %w[-c --create].freeze
    RAW_FLAGS = %w[-r --raw].freeze

    FLAGS = [CREATE_FLAGS, RAW_FLAGS].flatten.freeze

    ERROR_MSG = 'Option is invalid format. It is only available for `-c --create -d --downcase`'

    OptionParseError = Class.new(ArgumentError)

    def initialize(argv)
      @argv = argv
      @underscore_include_branch = Underscore.new(branch).convert
      @executer = Executor.instance
      @printer  = Printer.instance
    end

    def start
      return $stdout.puts Usage.new.content if @argv.empty?

      if with_all_flags?
        @executer.run_with_raw(@underscore_include_branch)
      elsif create_flags_without_raw_flags?
        @executer.run_with_downcase(@underscore_include_branch)
      elsif raw_flags_without_create_flags?
        @printer.run_with_raw(@underscore_include_branch)
      elsif without_any_flags?
        @printer.run_with_downcase(@underscore_include_branch)
      else
        raise OptionParseError, ERROR_MSG
      end
    end

    private

    def branch
      @argv.reject { |arg| FLAGS.include?(arg) }
    end

    def included?(flags)
      @argv.any? { |arg| flags.include?(arg) }
    end

    def not_included?(flags)
      !included?(flags)
    end

    def without_any_flags?
      not_included?(CREATE_FLAGS) && not_included?(RAW_FLAGS)
    end

    def with_all_flags?
      included?(CREATE_FLAGS) && included?(RAW_FLAGS)
    end

    def create_flags_without_raw_flags?
      included?(CREATE_FLAGS) && not_included?(RAW_FLAGS)
    end

    def raw_flags_without_create_flags?
      included?(RAW_FLAGS) && not_included?(CREATE_FLAGS)
    end
  end
end
