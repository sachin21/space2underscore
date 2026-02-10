# frozen_string_literal: true

require 'spec_helper'

describe Space2underscore::Converter do
  describe '.convert' do
    context 'with single argument containing spaces' do
      it 'replaces spaces with underscores' do
        result = described_class.convert(['foo bar baz'])
        expect(result).to eq('foo_bar_baz')
      end

      it 'handles multiple consecutive spaces' do
        result = described_class.convert(['foo  bar'])
        expect(result).to eq('foo_bar')
      end

      it 'strips leading/trailing spaces' do
        result = described_class.convert([' foo bar '])
        expect(result).to eq('foo_bar')
      end

      it 'includes underscore' do
        result = described_class.convert(['foo bar'])
        expect(result).to include('_')
      end
    end

    context 'with multiple arguments' do
      it 'joins with underscores' do
        result = described_class.convert(['foo', 'bar', 'baz'])
        expect(result).to eq('foo_bar_baz')
      end

      it 'includes underscore' do
        result = described_class.convert(['foo', 'bar'])
        expect(result).to include('_')
      end
    end

    context 'with empty input' do
      it 'returns empty string' do
        result = described_class.convert([])
        expect(result).to eq('')
      end
    end

    context 'with single word' do
      it 'returns the word as-is' do
        result = described_class.convert(['foo'])
        expect(result).to eq('foo')
      end
    end
  end
end
