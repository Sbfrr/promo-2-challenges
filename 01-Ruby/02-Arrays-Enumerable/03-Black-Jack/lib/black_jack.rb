def bank_score
  16 + rand(4)
end

def pick_card
  1 + rand(10)
end

def game_outcome(bank, score)
  [bank, score]
end
