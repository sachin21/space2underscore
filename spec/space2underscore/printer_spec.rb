# frozen_string_literal: true

require 'spec_helper'

describe Space2underscore::Printer do
  let(:branch) { 'FOO_bar' }

  describe '#run_with_raw' do
    subject { -> { described_class.instance.run_with_raw(branch) } }

    it { is_expected.to output(/FOO_bar/).to_stdout }
  end

  describe '#run_with_downcase' do
    subject { -> { described_class.instance.run_with_downcase(branch) } }

    it { is_expected.to output(/foo_bar/).to_stdout }
  end
end
