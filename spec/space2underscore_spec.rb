require 'spec_helper'

describe Space2underscore do
  it 'Successful execution' do
    expect(Space2underscore.convert(['fuga hoge foo'])).to eq('fuga_hoge_foo') # String case
    expect(Space2underscore.convert(%w(fuga hoge foo))).to eq('fuga_hoge_foo') # Array case
  end

  it 'Successful copied' do
    expect(Space2underscore.copy_command('fuga_hoge_foo')).to eq("echo fuga_hoge_foo | ruby -pe 'chomp' | pbcopy")
  end
end
