def sum_odd_indexed(array)
  sum = 0
  array.each_with_index do |element, index|
    sum += element unless index.even?
  end
  sum
end

def even_numbers(array)
  array.select {|number| number.even?}
end

def short_words(array, max_length)
  array.reject {|word| word.length > max_length}
end

def first_under(array, limit)
  array.find(ifnone = "over limited") {|number| number < limit }
end

def add_bang(array)
  array.map { |word| word += "!" }
end

def product(array)
  array.reduce(:*)
end

def sorted_pairs(array)
  result = []
  array.each_slice(2) do |group|
    result << group.sort_by {|element| element.downcase}
  end
  result
end


