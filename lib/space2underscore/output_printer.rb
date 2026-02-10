# frozen_string_literal: true

module Space2underscore
  # Prints branch names to stdout
  class OutputPrinter
    class << self
      # Print branch name to stdout
      #
      # @param name [String] Branch name to print
      # @return [void]
      def print(name)
        $stdout.puts name
      end
    end
  end
end
