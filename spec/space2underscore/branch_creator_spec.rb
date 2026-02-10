# frozen_string_literal: true

require 'spec_helper'

describe Space2underscore::BranchCreator do
  describe '.create' do
    it 'calls system with array arguments' do
      # Mock system call to verify correct arguments
      expect(described_class).to receive(:system)
        .with('git', 'checkout', '-b', 'test_branch', '--')
        .and_return(true)

      expect(described_class).to receive(:exit).with(true)

      described_class.create('test_branch')
    end

    context 'with special characters in branch name' do
      it 'safely handles shell metacharacters' do
        # Verify that special chars don't cause injection
        expect(described_class).to receive(:system)
          .with('git', 'checkout', '-b', 'branch; rm -rf /', '--')
          .and_return(false)

        expect(described_class).to receive(:exit).with(false)

        described_class.create('branch; rm -rf /')
      end
    end

    context 'with dash-prefixed branch name' do
      it 'prevents option injection via --' do
        expect(described_class).to receive(:system)
          .with('git', 'checkout', '-b', '-malicious', '--')
          .and_return(false)

        expect(described_class).to receive(:exit).with(false)

        described_class.create('-malicious')
      end
    end
  end
end
