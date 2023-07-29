require_relative 'calculadora'

# Perguntar para o usuário o primeiro número
puts "Digite o primeiro número: "
# armazenar o primeiro número
number1 = gets.chomp.to_i

# Perguntar para o usuário o segundo número
puts "Digite o segundo número: "
# armezenar o segundo número
number2 = gets.chomp.to_i
# Perguntar para o usuário qual a operação
puts "Qual operação deseja realizar: [+] [-] [*] [/] "
# armazenar a operação
operation = gets.chomp
# realizar a operação com os dois números do usuário

# mostrar o resultado
result = calculator(number1, number2, operation)

if result
  puts "O resultado é #{result}"
else
  puts "A operaçao selecionada não é válida"
  # 
end
