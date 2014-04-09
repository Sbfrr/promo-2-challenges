def pmu_format!(race_array)
  #TODO: modify the given array so that it is PMU-consistent
  i = 0
  race_array.map! {|item| "#{i+=1}-#{item}!"}
  race_array.reverse!
end


print pmu_format!(["Abricot du Laudot", "Black Caviar", "Brigadier Gerard"])

