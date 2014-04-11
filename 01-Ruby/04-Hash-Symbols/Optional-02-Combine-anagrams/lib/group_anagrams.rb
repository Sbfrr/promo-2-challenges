def sorted(word)
  word.chars.sort.join.downcase
end

def group_anagrams(words)

  anagrams = {}
  anagrams_array = []

  words.each do |word|
    anagrams[sorted(word)] ? anagrams[sorted(word)] << word : anagrams[sorted(word)] = [word]
  end

  anagrams.each do |key, value |
    anagrams_array << value
  end

end


# input:
p group_anagrams( ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] )

# =>  [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]
