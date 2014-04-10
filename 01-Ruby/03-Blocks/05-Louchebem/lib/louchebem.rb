# Encoding: utf-8
# constraint: you should pick your final random suffix in ["em", "é", "ji", "oc", "ic", "uche", "ès"]
# constraint: one-letter word like "a" or "l" should not be translated
# constraint: word beginning with a vowel should be translated differently. Ex: "atout" may give "latoutoc"
# enhancement: ideally your program should be able to translate any complicated sentence, eventually embedding special characters like "!", or "'".

SUFFIX = ["em", "é", "ji", "oc", "ic", "uche", "ès"]
CONSONNANTS = ["b", "c" ,"d" ,"f" ,"g" ,"h" ,"j" ,"k" ,"l" ,"m" ,"n" ,"p" ,"q" ,"r" ,"s" ,"t" ,"v" ,"w" ,"x" , "z"]
SPECIAL = [",", ";", ":", ".", "?", "!", "\"", "(", ")", "-", "_" ]

def louchebemize_word(word)

  length = word.length
  first = word[0]
  second = word[1]

  unless length == 1
    if CONSONNANTS.include? (first.downcase)
      if CONSONNANTS.include? (second.downcase)
        word[0] = ""
        word[0] = ""
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