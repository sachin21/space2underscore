require 'spec_helper'

describe Space2underscore do
  it 'returns underscore included in string' do
    expect(Space2underscore.convert(['fuga hoge foo'])).to include('_') # String case
    expect(Space2underscore.convert(%w(fuga hoge foo))).to include('_') # Array case
  end
end
