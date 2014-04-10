def shuffle_word(a_word)
  #TODO: refactor this method

  shuffle_array = a_word.upcase.chars.to_a.shuffle

end


def quote_prime_numbers(n)
  #TODO: refactor this method

  prime_numbers = (1..n).find_all do |i|
    dividers = (2..i-1).select {|k| i % k == 0 }
    dividers.count == 0
  end

  prime_numbers.map{ |prime_num| "#{prime_num} is prime"}


#trouver les éléments parmis (1..n) dont aucun (count == 0) élément  parmis  (2..élément-1)
#ne les divise sans reste et les mapper

end

puts quote_prime_numbers(10)






