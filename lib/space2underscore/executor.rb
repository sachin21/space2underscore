# frozen_string_literal: true

module Space2underscore
  class Executor
    include Singleton

    def run_with_raw(underscore_include_sentence)
      run underscore_include_sentence
    end

    def run_with_downcase(underscore_include_sentence)
      run underscore_include_sentence.downcase
    end

    private

    def run(sentence)
      exit system "git checkout -b #{sentence}"
    end
  end
end
