money = 100 # Seu saldo para apostas

# Mensagem de boas vindas
puts "***************************************************************"
puts "* Bem vindo à corrida de cavalos. Cavalos que estão no páreo: *"
puts "***************************************************************"
loop do
  puts "Seu saldo é de $#{money}"

  # Mostrar o nome dos cavalos que vão competir
  horses = ["Pé de Pano", "Malhado", "Bucéfalo"]
  horses.each_with_index do |horse, index|
    puts "#{index + 1} #{horse}"
  end
  # Perguntar em qual cavalo ele quer apostar
  puts "Escolha seu cavalo"
  choice = gets.chomp.to_i - 1

  # Simula a corrida dos cavalos
  results = horses.shuffle
  puts "*********************************************************"
  # Mostrar o resultado da corrida
  puts "Esse é o resultado da corrida:"
  results.each_with_index do |horse, index|
    puts "#{index + 1} #{horse}"
  end
  puts "*********************************************************"
  # Mostrar se o usuário ganhou ou perdeu
  if results[0] == horses[choice]
    puts "Você venceu! :D"
    money += 10 # Ganhou, aumenta o dinheiro
  else
    puts "Você perdeu! D:"
    money -= 20 # Ganhou, diminui o dinheiro
  end
  puts "*********************************************************"
  break if money <= 0 # Sai do loop de acabou o dinheiro
end
puts "*********************************************************"
puts "Você está falido... procure um agiota."
