# frozen_string_literal: true

require 'spec_helper'

describe Space2underscore::OptionsParser do
  describe '.parse' do
    context 'with no arguments' do
      it 'returns nil' do
        expect(described_class.parse([])).to be_nil
      end
    end

    context 'with branch name only' do
      it 'returns print action with downcase' do
        options = described_class.parse(['new', 'branch'])
        expect(options.action).to eq(:print)
        expect(options.downcase).to be true
        expect(options.input).to eq(['new', 'branch'])
      end
    end

    context 'with -c flag' do
      it 'returns create action with downcase' do
        options = described_class.parse(['new', 'branch', '-c'])
        expect(options.action).to eq(:create)
        expect(options.downcase).to be true
        expect(options.input).to eq(['new', 'branch'])
      end
    end

    context 'with -r flag' do
      it 'returns print action without downcase' do
        options = described_class.parse(['new', 'branch', '-r'])
        expect(options.action).to eq(:print)
        expect(options.downcase).to be false
        expect(options.input).to eq(['new', 'branch'])
      end
    end

    context 'with both -c and -r flags' do
      it 'returns create action without downcase' do
        options = described_class.parse(['new', 'branch', '-c', '-r'])
        expect(options.action).to eq(:create)
        expect(options.downcase).to be false
        expect(options.input).to eq(['new', 'branch'])
      end
    end

    context 'with --create and --raw flags' do
      it 'handles long form flags' do
        options = described_class.parse(['new', '--create', '--raw'])
        expect(options.action).to eq(:create)
        expect(options.downcase).to be false
        expect(options.input).to eq(['new'])
      end
    end

    context 'with flags only (no branch name)' do
      it 'raises ParseError' do
        expect {
          described_class.parse(['-c'])
        }.to raise_error(Space2underscore::OptionsParser::ParseError, 'Branch name is required')
      end
    end

    context 'with single word' do
      it 'returns correct options' do
        options = described_class.parse(['feature'])
        expect(options.input).to eq(['feature'])
        expect(options.action).to eq(:print)
        expect(options.downcase).to be true
      end
    end
  end
end
