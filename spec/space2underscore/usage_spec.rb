# frozen_string_literal: true

require 'spec_helper'

describe Space2underscore::Usage do
  subject { described_class.new.content }

  it { is_expected.to be_a String }
  it { is_expected.not_to be_empty }
end
