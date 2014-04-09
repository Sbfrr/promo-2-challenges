require_relative "wagon_sort"

students = []

begin
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets
  name.chomp! if name
  students << name unless name == ""

  # TODO: Add the name we just gotto the students array

end while name != ""
length = students.length

# TODO: Call `wagon_sort` method and display the sorted student list
wagon_sort(students)
puts "Congratulation! Your Wagon has #{length} students:"
for i in 0...(length - 2) do
  print "#{students[i]}, "
end
print  "#{students[length - 2]} and #{students[length-1]}"
