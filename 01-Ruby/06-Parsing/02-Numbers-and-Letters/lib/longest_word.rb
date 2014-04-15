require 'open-uri'
require 'json'

ALPHABET = %w{A B C D E F G H I J K L M N O P Q R S T U V W X Y Z}

def generate_grid(grid_size)
  grid = []
  for i in 0...grid_size
    grid << ALPHABET[rand(26)]
  end
  grid
end

def run_game(attempt, grid, start_time, end_time)
  result = {}
  result[:time] = end_time - start_time

  word_in_grid = true
  attempt_array = attempt.upcase.each_char.to_a
  attempt_array.each do |letter_attempt|
   word_in_grid = false unless grid.include?(letter_attempt)
  end

  data = JSON.parse(open("http://api.wordreference.com/0.8/80143/json/enfr/#{attempt}").read)

  if word_in_grid == false
    result[:score] = 0
    result[:message] = "not in the grid"
  elsif data["Error"] == "NoTranslation"
    result[:score] = 0
    result[:message] = "not an english word"
  else
    result[:score] = [100 - end_time.to_i + start_time.to_i, 0].max + attempt.length*10
    result[:translation] = data["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"].split(" ")[0]
    result[:time] = end_time - start_time
    result[:message] = "well done"
  end

  result
end