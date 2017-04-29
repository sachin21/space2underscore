module Space2underscore
  class Cli
    CREATE_FLAGS = %w(-c --create).freeze

    def initialize(argv)
      @argv = argv
      @underscore_include_sentence = Underscore.new(sentence).convert
    end

    def start
      if @argv.empty?
        $stdout.puts Usage.new.content
        exit
      end

      if included?
        exit Executor.new(@underscore_include_sentence).create
      else
        $stdout.puts @underscore_include_sentence
      end
    end

    private

    def sentence
      @argv.reject { |arg| CREATE_FLAGS.include?(arg) }
    end

    def included?
      @argv.any? { |arg| CREATE_FLAGS.include?(arg) }
    end
  end
end
