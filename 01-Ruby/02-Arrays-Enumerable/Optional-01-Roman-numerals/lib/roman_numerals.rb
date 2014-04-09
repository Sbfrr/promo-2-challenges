def old_roman_numeral(integer)

  #TODO: translate integer in roman number - old-style way
  values = [1000, 500, 100, 50, 10, 5, 1]
  letters = ["M", "D", "C", "L", "X", "V", "I"]
  builder_index = []

  index = 0
  until index == 7 do
    builder_index << integer/values[index]
    integer = integer % values[index]
    index += 1
  end

  index = 0
  until index == 7 do
    print letters[index]*builder_index[index]
    index += 1
  end

end



def roman_numeral(integer)
  #TODO: translate integer in roman number - old-style way
  values = [1000, 500, 100, 50, 10, 5, 1]
  letters = ["M", "D", "C", "L", "X", "V", "I"]
  builder_index = []

  index = 0
  until index == 7 do
    builder_index << integer/values[index]
    integer = integer % values[index]
    index += 1
  end

  index = 0
  until index >= 7 do
    if builder_index[index] == 1 && builder_index[index + 1] == 4
      print letters[index + 1]
      print letters[index - 1]
      index += 2
    elsif builder_index[index] == 4
      print letters[index]
      print letters[index-1]
      index += 2
    else
      print letters[index]*builder_index[index]
      index += 1
    end
  end

end


puts "Number?"
x = gets.chomp.to_i
puts old_roman_numeral(x)
puts roman_numeral(x)

=begin

* I = 1
* V = 5
* X = 10
* L = 50
* C = 100
* D = 500
* M = 1000

=end