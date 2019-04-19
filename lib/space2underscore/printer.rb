# frozen_string_literal: true

module Space2underscore
  class Printer
    include Singleton

    def run_with_raw(branch)
      run branch
    end

    def run_with_downcase(branch)
      run branch.downcase
    end

    private

    def run(branch)
      $stdout.puts branch
    end
  end
end
