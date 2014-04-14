require "space2underscore/version"

module Space2underscore
  def self.convert_to_underscore(argv)
    if argv
      space_include = argv.gsub(/\s/, '_')
      copy_command = `echo #{space_include} | ruby -ne 'print $_.chomp' | pbcopy`
      return space_include, copy_command
    else
      raise "Error! Please enter string"
    end
  end
end
