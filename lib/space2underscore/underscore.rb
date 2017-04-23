module Space2underscore
  class Underscore
    def initialize(sentence)
      @sentence = sentence
    end

    def convert
      @sentence.length == 1 ? @sentence[0].strip.gsub(/\s/, '_') : @sentence.join('_')
    end
  end
end
