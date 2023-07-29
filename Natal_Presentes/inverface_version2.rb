require "colored"
require "csv"
require 'open-uri'
require 'nokogiri'

FILENAME = "./gifts.csv"

def list(gifts)
  gifts.each_with_index do |gift, index|
    status = gift[:bought] ? "[x]" : "[ ]"
    puts "#{index + 1} - #{status} #{gift[:name]}".blue
  end
end

def add(gifts)
  puts "Qual presente deseja adicionar?".yellow
  gift = gets.chomp
  gifts << { name: gift, bought: false }
  save(gifts)
end

def delete(gifts)
  list(gifts)
  puts "Qual o número do presente que você deseja excluir?".yellow
  index = gets.chomp.to_i - 1
  if index.between?(0, gifts.size - 1)
    gifts.delete_at(index)
    puts "Presente removido".red
    save(gifts)
  else
    puts "Número inválido".red
  end
end

def mark(gifts)
  list(gifts)
  puts "Qual o número do presente que você deseja marcar como comprado?".yellow
  index = gets.chomp.to_i - 1
  if index.between?(0, gifts.size - 1)
    gifts[index][:bought] = true
    save(gifts)
  else
    puts "Número inválido".red
  end
end

def import(gifts)
  puts "Qual produto quer pesquisar?"
  product = gets.chomp.gsub(' ', '-')

  url = "https://www.kabum.com.br/busca/#{product}"

  doc = Nokogiri::HTML(URI.open(url))
  products = doc.search('h2').first(5).map(&:text)

  products.each_with_index do |product, index|
    puts "#{index + 1} - #{product.blue}"
  end

  puts "Qual o número do produto para importar?"
  index = gets.chomp.to_i - 1
  if index.between?(0, products.size - 1)
    gifts << { name: products[index], bought: false }
    save(gifts)
  else
    puts "Número inválido".red
  end
end

def load
  CSV.foreach(FILENAME).map do |row|
    { name: row[0], bought: row[1] == "true" }
  end
end

def save(gifts)
  CSV.open(FILENAME, "wb") do |csv|
    gifts.each { |gift| csv << [gift[:name], gift[:bought]] }
  end
end

def welcome_message
  puts "=".green * 40
  puts "Boas vindas à nossa lista de presentes".red
  puts "=".green * 40
end

def goodbye_message
  puts "Obrigado e feliz Natal"
end

def main
  gifts = File.exist?(FILENAME) ? load : []
  welcome_message

  loop do
    puts "O que você quer fazer? (A)dicionar, (D)eletar, (L)istar, (M)arcar, (I)mportar ou (S)air"
    choice = gets.chomp.upcase

    case choice
    when "A" then add(gifts)
    when "D" then delete(gifts)
    when "L" then list(gifts)
    when "M" then mark(gifts)
    when "I" then import(gifts)
    when "S"
      save(gifts)
      break
    else
      puts "Ação inválida".red
    end
  end

  goodbye_message
end

main
