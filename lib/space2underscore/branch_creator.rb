# frozen_string_literal: true

module Space2underscore
  # Creates git branches with secure command execution
  class BranchCreator
    class << self
      # Create a new git branch with the given name
      #
      # @param name [String] Branch name to create
      # @return [void]
      # @raise [SystemExit] Exits with git command status code
      def create(name)
        # Use array form to prevent command injection
        # Place branch name directly after -b as git requires,
        # then -- to separate from any start-point ambiguity
        exit system('git', 'checkout', '-b', name, '--')
      end
    end
  end
end
