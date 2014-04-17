require 'spec_helper'

describe Space2underscore do
  it 'Successful execution' do
    expect(Space2underscore.convert_to_underscore(['fuga hoge foo']).first).to eq('fuga_hoge_foo') # String case
    expect(Space2underscore.convert_to_underscore(%w(fuga hoge foo)).first).to eq('fuga_hoge_foo') # Array case
  end
end
