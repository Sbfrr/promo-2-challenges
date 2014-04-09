require_relative 'black_jack'

def play_game
  score = 0
  bank = bank_score

  while asking_for_card?(score) do
    score += pick_card
    puts state_of_the_game(score, bank)
  end

  puts state_of_the_game(score, bank)
  print build_message_for(game_outcome(bank, score))

end


def state_of_the_game(score, bank)
<<<<<<< HEAD
  "Your score is #{score}, bank is #{bank}!"
=======
  # TODO: Returns custom message with player's score and bank's score
>>>>>>> b665b07f415b1196efce9f8e4819cf835e30f816
end


def asking_for_card?(score)
  if score <= 21
    puts "Card ? (type 'Y' or 'yes' for a new card)"
    input = gets.chomp
    (input == "yes" || input == "Y") ? true : false
  else
    false
  end
end



def build_message_for(outcome)
  if outcome[1] > 21
    "You are over 21... you loose."
  elsif outcome[1] == 21
    "Black Jack!"
  elsif outcome[1] < outcome[0]
    "Bank beats you! You loose."
  elsif outcome[1] > outcome[0]
    "You beat the bank! You win."
  else
    "Both score equal, the bank wins anyway"
  end
end
