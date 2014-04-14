
def sorted(a)
  b = ""
  a.each_char do |letter|
    b += letter.match(/\w+/).to_s
  end
  b.downcase.chars.sort.join
end

def sorted_hash(a)
  c = {}
  sorted(a).each_char do |letter|
    c[letter] == nil ?  c[letter] = 1 : c[letter] += 1
  end
end

def anagrams?(a, b)
  sorted(a) == sorted(b)

end

def anagrams_on_steroids?(a, b)
  sorted_hash(a) == sorted_hash(b)
end

