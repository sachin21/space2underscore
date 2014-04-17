require 'space2underscore/version'

module Space2underscore
  def self.convert_to_underscore(argv)
    space_include_sentence = argv.length == 1 ? argv.first.gsub(/\s/,  '_') : argv.join('_')
    copy_command = `echo #{space_include_sentence} | ruby -pe 'chomp' | pbcopy`
    return space_include_sentence, copy_command
  end
end
