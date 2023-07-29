computer_coin = ["heads", "tails"]

player_coin = ""

while computer_coin != player_coin
  puts "Guess the coin side (HEADS or TAILS)"
  player_coin = gets.chomp.downcase

  if computer_coin == player_coin
    verb = "you won!!"
  else
    verb = "you lost! TRY AGAIN!"
  end

  puts "#{verb}."
end

# 
# ou podemos fazer assim>>
# # # verb = (computer_coin == player_coin) ? "you won!" : "you lost!"
