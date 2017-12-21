module Space2underscore
  class Cli
    CREATE_FLAGS = %w[-c --create].freeze
    RAW_FLAGS = %w[-r --raw].freeze

    FLAGS = [CREATE_FLAGS, RAW_FLAGS].flatten.freeze

    OptionParseError = Class.new(ArgumentError)

    def initialize(argv)
      @argv = argv
      @underscore_include_branch = Underscore.new(branch).convert
    end

    def start
      $stdout.puts Usage.new.content && exit if @argv.empty?

      case
      when included?(CREATE_FLAGS) && included?(RAW_FLAGS)
        Executor.new(@underscore_include_branch).run_with_raw
      when included?(CREATE_FLAGS) && not_included?(RAW_FLAGS)
        Executor.new(@underscore_include_branch).run_with_downcase
      when not_included?(CREATE_FLAGS) && included?(RAW_FLAGS)
        Printer.instance.run_with_raw(@underscore_include_branch)
      when not_included?(CREATE_FLAGS) && not_included?(RAW_FLAGS)
        Printer.instance.run_with_downcase(@underscore_include_branch)
      else
        raise OptionParseError, 'Option is invalid format. It is only avaliable for `-c --create -d --downcase`'
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
  end
end
