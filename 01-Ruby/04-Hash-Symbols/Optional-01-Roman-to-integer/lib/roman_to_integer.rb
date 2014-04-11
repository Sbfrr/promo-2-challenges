require 'pry'

ROMAN = {

  "IV" => 4,
  "IX" => 9,
  "XL" => 40,
  "XC" => 90,
  "CD" => 400,
  "CM" => 900,
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100,
  "D" => 500,
  "M" => 1000
}

VALUES = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
LETTERS = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]




def roman_to_integer(string)
  #TODO: translate roman string to integer

  integer = 0
  until string == "" do

    ROMAN.each_key do |key|
      if string[0..1] == key
        index = LETTERS.index(key)
        integer += VALUES[index]
        string[0..1] = ""
      end
    end

    ROMAN.each_key do |key|
      if string[0] == key
        index = LETTERS.index(key)
        integer += VALUES[index]
        string[0] = ""
      end
    end

  end

  integer

end

# testing your program
puts roman_to_integer('IV') == 4 # => true
puts roman_to_integer('XII') == 12 # => true
puts roman_to_integer('XIX') == 19 # => true

#I = 1 - V = 5 - X = 10 - L = 50 - C = 100 - D = 500 - M = 1000

