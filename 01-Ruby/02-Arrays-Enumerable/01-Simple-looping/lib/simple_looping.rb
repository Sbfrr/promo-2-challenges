def sum_with_while(min,max)
  sum = 0
  while min <= max do
    sum += min
    min += 1
  end
  sum
end


def sum_with_for(a, b)
  sum = 0
  for i in (a..b) do
    sum += i
  end
  sum
end


def sum_recursive(a,b)
  if a > b
    raise ArgumentError.new
  else
    a >= b ? b : a + sum_recursive(a+1, b)
  end
end



