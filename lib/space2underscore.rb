require 'space2underscore/version'

module Space2underscore
  def self.convert(argv)
    argv.length == 1 ? argv[0].strip.gsub(/\s/,  '_') : argv.join('_')
  end

  def self.create_new_branch(underscore_include_sentence)
    system "git checkout -b #{underscore_include_sentence}"
  end
end
