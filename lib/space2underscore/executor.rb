module Space2underscore
  class Executor
    def initialize(underscore_include_sentence)
      @underscore_include_sentence = underscore_include_sentence
    end

    def run
      system "git checkout -b #{@underscore_include_sentence}"
    end
  end
end
