# Encoding: utf-8

SUFFIX = ["em", "é", "ji", "oc", "ic", "uche", "ès"]
CONSONNANTS = ["b", "c" ,"d" ,"f" ,"g" ,"h" ,"j" ,"k" ,"l" ,"m" ,"n" ,"p" ,"q" ,"r" ,"s" ,"t" ,"v" ,"w" ,"x" , "z"]

def louchebemize_word(word)

  length = word.length
  first = word[0]
  second = word[1]

  unless length == 1
    if CONSONNANTS.include? (first.downcase)
      if CONSONNANTS.include? (second.downcase)
        word[0..1] = ""
        "l#{word}#{first + second}#{SUFFIX[rand(6)]}"
      else
        word[0] = ""
        "l#{word}#{first}#{SUFFIX[rand(6)]}"
      end
    else
      "l#{word}#{SUFFIX[rand(6)]}"
    end
  else
    word
  end

end

def louchebemize(sentence)
  #TODO: implement your louchebem translator
  sentence_words = sentence.split(/\b/)
  sentence_words_louchebemize = sentence_words.map {|word| word =~ /\W/ ? word : louchebemize_word(word) }
  sentence_words_louchebemize.join("")
end