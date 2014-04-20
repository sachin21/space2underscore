require 'space2underscore/version'

module Space2underscore
  def self.convert(argv)
    argv.length == 1 ? argv.first.gsub(/\s/,  '_') : argv.join('_')
  end

  def self.copy_command(space_include_sentence)
    "echo #{space_include_sentence} | ruby -pe 'chomp' | pbcopy"
  end
end
