module Space2underscore
  class Executor
    def initialize(underscore_include_sentence)
      @underscore_include_sentence = underscore_include_sentence
    end

    def run_with_raw
      run @underscore_include_sentence
    end

    def run_with_downcase
      run @underscore_include_sentence.downcase
    end

    private

    def run(sentence)
      exit system "git checkout -b #{sentence}"
    end
  end
end
