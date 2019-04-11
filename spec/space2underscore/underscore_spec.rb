# frozen_string_literal: true

require 'spec_helper'
require 'open3'

describe Space2underscore::Underscore do
  describe '#convert' do
    subject { described_class.new(argument).convert }

    context 'when number of argument is one' do
      let(:argument) { ['foo bar'] }

      it { is_expected.to include('_') }
    end

    context 'when number of argument is many' do
      let(:argument) { %w[foo bar] }

      it { is_expected.to include('_') }
    end
  end
end
