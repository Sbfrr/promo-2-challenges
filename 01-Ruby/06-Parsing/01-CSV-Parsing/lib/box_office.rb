
require 'rubygems'
require 'ccsv'
require 'csv'

movies = []

def csv_to_array_of_hash(file_name)
  movies = []
  CSV.foreach(file_name) do |line|
    movie = {
      name: line[0],
      year: line[1].to_i,
      earnings: line[2].to_i
    }
    movies << movie
  end
  movies
end

def most_successfull(number, max_year, file_name)
  #TODO: return the number most successfull movies max_year

  movies = csv_to_array_of_hash(file_name)
  target = []
  solution = []

  movies.each do |movie|
   target << movie if movie[:year] < max_year
  end

  target.sort_by{|x| x[:earnings]}.reverse!

  for i in 0...number do
    solution << target[i]
  end

  solution

end
