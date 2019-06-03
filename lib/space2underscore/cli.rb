# frozen_string_literal: true

module Space2underscore
  require 'optparse'

  class Cli
    CREATE_FLAGS = %w[-c --create].freeze
    RAW_FLAGS = %w[-r --raw].freeze

    FLAGS = [CREATE_FLAGS, RAW_FLAGS].flatten.freeze

    OptionParseError = Class.new(ArgumentError)

    ERROR_MSG = "Option is invalid format. options are only avaliable for `-c --create -d --downcase`"

    def initialize(argv)
      @argv = argv
      @underscore_include_branch = Underscore.new(branch).convert
      @executer = Executor.instance
      @printer  = Printer.instance
    end

    def start
      return $stdout.puts Usage.new.content if @argv.empty?

      op = OptionParser.new
      op.on(*CREATE_FLAGS) do |v|
        opts[:create] = v
      end
      op.on(*RAW_FLAGS) do |v|
        opts[:string] = v
      end

      args = op.parse!(ARGV)

      if args
        @executer.run_with_raw(@underscore_include_branch)
      elsif create_flags_without_raw_flags?
        @executer.run_with_downcase(@underscore_include_branch)
      elsif raw_flags_without_create_flags?
        @printer.run_with_raw(@underscore_include_branch)
      elsif invalid_options?
        @printer.run_with_downcase(@underscore_include_branch)
      else
        $stderr.puts ERROR_MSG
      end
    rescue OptionParser::InvalidOption => e
      puts e.message
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

    def invalid_options?
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
