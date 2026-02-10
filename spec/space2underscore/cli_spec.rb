# frozen_string_literal: true

require 'spec_helper'

describe Space2underscore::Cli do
  describe '#start' do
    context 'with no arguments' do
      it 'displays usage' do
        cli = described_class.new([])
        expect { cli.start }.to output(/NAME:/).to_stdout
      end
    end

    context 'with print action' do
      it 'prints downcased branch name' do
        cli = described_class.new(['New', 'Branch'])
        expect { cli.start }.to output("new_branch\n").to_stdout
      end

      it 'prints raw case with -r flag' do
        cli = described_class.new(['New', 'Branch', '-r'])
        expect { cli.start }.to output("New_Branch\n").to_stdout
      end

      it 'prints with --raw flag' do
        cli = described_class.new(['New', 'Branch', '--raw'])
        expect { cli.start }.to output("New_Branch\n").to_stdout
      end
    end

    context 'with create action' do
      it 'calls BranchCreator with downcased name' do
        cli = described_class.new(['new', 'branch', '-c'])

        expect(Space2underscore::BranchCreator).to receive(:create)
          .with('new_branch')

        cli.start
      end

      it 'calls BranchCreator with raw case when -r flag present' do
        cli = described_class.new(['New', 'Branch', '-c', '-r'])

        expect(Space2underscore::BranchCreator).to receive(:create)
          .with('New_Branch')

        cli.start
      end

      it 'calls BranchCreator with --create and --raw flags' do
        cli = described_class.new(['Feature', 'Name', '--create', '--raw'])

        expect(Space2underscore::BranchCreator).to receive(:create)
          .with('Feature_Name')

        cli.start
      end
    end

    context 'with parse error' do
      it 'outputs error and exits with status 1' do
        cli = described_class.new(['-c']) # Missing branch name

        expect { cli.start }.to output(/Error: Branch name is required/).to_stderr
                                  .and raise_error(SystemExit) { |error|
                                    expect(error.status).to eq(1)
                                  }
      end
    end

    context 'with single word' do
      it 'prints the word' do
        cli = described_class.new(['feature'])
        expect { cli.start }.to output("feature\n").to_stdout
      end

      it 'converts to downcase by default' do
        cli = described_class.new(['Feature'])
        expect { cli.start }.to output("feature\n").to_stdout
      end
    end

    context 'with multiple words containing spaces' do
      it 'converts spaces to underscores' do
        cli = described_class.new(['foo bar baz'])
        expect { cli.start }.to output("foo_bar_baz\n").to_stdout
      end
    end
  end
end
