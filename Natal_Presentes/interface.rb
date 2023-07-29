require "colored"
require "csv"
require 'open-uri'
require 'nokogiri'

FILENAME = "./gifts.csv" 

def list(gifts)
  # Listar os presentes com o seu respectivo número
  gifts.each_with_index do |gift, index|
    bought = gift[:bought] ? "[x]" : "[ ]"
    puts "#{index + 1} - #{bought} #{gift[:name]}".blue
  end
end

def add(gifts)
  # Perguntar qual presente adicionar
  puts "Qual presente deseja adicionar?".yellow
  gift = gets.chomp
  # colocar o presente na lista
  gifts << { name: gift, bought: false }
  save(gifts)
end

def delete(gifts)
  # Listar todos os presentes
  list(gifts)
  # Pergunta qual o número do presente a ser excluído
  puts "Qual o numero do presente que voce deseja excluir?".yellow
  index = gets.chomp.to_i - 1

  # Remove o presente pelo index
  if index >= 0 && index < gifts.size
    gifts.delete_at(index)
    puts "Presente removido".red
    save(gifts)
  else
    puts "numero inválido".red
  end
end

def mark(gifts)
  # lista todos os presentes
  list(gifts)
  # pergunta o presente que ja foi comprado
  puts "Qual o numero do presente que voce deseja marcar como comprado?".yellow
  index = gets.chomp.to_i - 1
  if index >= 0 && index < gifts.size

  # marcar o presente pelo index
    gift = gifts[index]
    gift[:bought] = true
    save(gifts)
  else
    "Numero INVALIDO"
  end
end

def import(gifts)
  puts "Qual produto quer pesquisar?"
  product = gets.chomp.gsub(' ','-')

  url = "https://www.kabum.com.br/busca/#{product}"

  file = URI.open(url).read
  doc = Nokogiri::HTML.parse(file)

  products = []
  doc.search('h2').first(5).each_with_index do |h2, index|
    puts "#{index + 1} - #{h2.text.blue}"
    products << h2.text
  end

  puts "Qual o número do produto para importar?"
  index = gets.chomp.to_i - 1

  gifts << { name: products[index], bought: false }

  save(gifts)
end

def load
  # file = "gifts.csv"
  gifts = []
  CSV.foreach(FILENAME) do |row|
    gifts << { name: row[0], bought: row[1] == "true" }
  end
  gifts
end

  def save(gifts)
  # estamos criando um arquivo CSV, o WD server para criar ou subistituir arquivo
  # file = "gifts.csv"
    CSV.open(FILENAME, "wb") do |csv|
      gifts.each do |gift|
        csv << [gift[:name], gift[:bought]]
      end
    end
  end

############################
#  AQUI COMECA o PROGRAMA  #
############################

gifts = []
gifts = load if File.exist?(FILENAME)

# Mensagem de boas vindas
puts "=".green * 40
puts "Boas vindas a nossa lista de presentes".red
puts "=".green * 40

# LOOP
loop do
  # Perguntar qual a ação
  puts "O que voce quer fazer? (A)dicionar, (D)eletar , (L)istar, (M)arcar, (I)mportar ou (S)air)"
  choice = gets.chomp.upcase

  # De acordo com a ação executar o que foi selecionado
  case choice
  when "A" then add(gifts)
  when "D" then delete(gifts)
  when "L" then list(gifts)
  when "M" then mark(gifts)
  when "I" then import(gifts)
  when "S" then break
  else
    puts "Ação invalida"
  end
# FIM DO LOOP
end

# Mensagem de tchau
puts "Obrigado e feliz natal"
