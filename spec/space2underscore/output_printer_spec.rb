# frozen_string_literal: true

require 'spec_helper'

describe Space2underscore::OutputPrinter do
  describe '.print' do
    it 'outputs to stdout' do
      expect { described_class.print('test_branch') }.to output("test_branch\n").to_stdout
    end

    context 'with uppercase letters' do
      it 'preserves case' do
        expect { described_class.print('FOO_bar') }.to output("FOO_bar\n").to_stdout
      end
    end

    context 'with lowercase letters' do
      it 'outputs lowercase' do
        expect { described_class.print('foo_bar') }.to output("foo_bar\n").to_stdout
      end
    end
  end
end
