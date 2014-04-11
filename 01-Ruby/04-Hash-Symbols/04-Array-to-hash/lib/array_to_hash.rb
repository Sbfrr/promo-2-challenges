def array_to_hash(array)
  hash = {}
  array.each_with_index do |item, index|
    block_given? ? hash[yield index] = item : hash[index] = item
  end
  hash
end