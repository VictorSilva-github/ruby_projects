
puts "================== RECAP ======================= "
puts "================== CRUD ========================"
puts "========= CREATE READ UPDATE DELETE ============"
# CRUD
# CREATE READ UPDATE DELETE
42                          # Integer
1.25                        # Float
true                        # Boolean
"hello world"               # String
[ "a", "e", "i", "o", "u" ] # Array


students =     [ "Peter", "Mary", "George", "Emma" ]
student_ages = [ 24     , 25    , 22      ,  20    ]
# Write a program to display a list of students with their age

students.each_with_index do |student, index|
  # ASSIM com definicao de variavel
  # age = student_ages[index]
  puts "- #{student} (#{student_ages[index]} years old)"
end
    # O problema DO ARRAY, SE colocarmos um novo STUDENT na possicao ERRADA (NO LUGAR DO PETER) e
    # NAO colocarmos AGE(IDADE)
    # O CODIGO ficar estranho, olher ABAIXO.
puts "====================== ARRAY MODIFICADO ========================="
students =     [ "Victor", "Mary", "Elefante", "Emma", "Joao" ]
student_ages = ["", 25    , 22      ,  20    ]
students.each_with_index do |student, index|
    puts "- #{student} (#{student_ages[index]} years old)"
  end
  puts "OLHA ISSO! Student sem idade"


  puts "********************* ARRAY SELECT ***********************"

    musicians = ["Victor Silva", "Fabiana", "Maria ", "Roberto"]

    musicians = musicians.select do |musician|
    musician.start_with?("R", "V")
    end

    p musicians

puts "====================== HASH ========================="
# # Do you like this solution? 
# #Imagine with 10k students in the array.
# # You have to know that "sebastien" has index 6783 to read his age.
# # Hard to maintain, you’ll make mistakes when updating or injecting students.

paris = {
    "country" => "France",
    "population" => 2211000
  }

  paris = {
    "country" => "France",
    "population" => 2211000
  }

  # You can add a new key/value to your hash with:
 puts paris
 puts paris["star_monument"] = "Tour Eiffel"
 puts "Add o monumento: veja >> #{paris}"

 puts "====================== 3 keys 3 valores ========================="
# Deleting key/value pair
 
paris = {
    "country" => "France",
    "population" => 2211000,
    "star_monument" => "Tour Eiffel"
  }

paris.each do |key, value|
  puts "Paris #{key} is #{value}"
end

puts "====================== DELETANDO star_monument ========================="
paris.delete("star_monument")
puts "Paris is the capital of #{paris["country"]}"
puts "The population of paris is #{paris["population"]}"

puts "====================== others ========================="

paris = {
    "country" => "France",
    "population" => 2211000,
    "star_monument" => "Tour Eiffel"
  }

  puts "HASH with key => value"
p "tem -PAIS- NESSE HASH? #{paris.key?("country")}"   #=> true
p "tem -LANGUAGE- ness HASH? #{paris.key?("language")}"  #=> false
p "Quais sao as suas KEYS? #{paris.keys}"  #=> ["country", "population", "star_monument"]
p "Quais sao os seus valores? #{paris.values}" #=> ["France", 2211000, "Tour Eiffel"]

puts "====================== others 2 ========================="
puts "HASH with key : value"
paris = {
        country: "France",
        population: 2211000,
        star_monument: "Tour Eiffel"
    }
p "tem -PAIS- NESSE HASH? #{paris.key?(:country)}"   #=> true
p "tem -LANGUAGE- ness HASH? #{paris.key?(:language)}"  #=> false
p "Quais sao as suas KEYS? #{paris.keys}"  #=> ["country", "population", "star_monument"]
p "Quais sao os seus valores? #{paris.values}" #=> ["France", 2211000, "Tour Eiffel"]

puts "====================== HASH 2 values ========================="

  pizzas_taste = {
    "HOME_MADE" => ["olive", "salad", "ham", "meat"],
    "4CHEESEs" =>  ["cheese", "cheese", "cheese", "cheese"],
    "Peperoni" =>  ["peperoni", "cheese", "chicken", "tomato"]
  }

   pizzas_taste.each_with_index do |pizzas, ingredientes|
    puts "sabores sao #{pizzas} is #{ingredientes}"
    end

    "***************************WHILE****************************"

        count = 0 
        while count <= 10
            puts count
            count += 1
        end
puts "****************** while 2 ***************************"
    price = rand(1..2)
    puts "Adivinhe um numero entre 1 a 2"
    guess = gets.chomp.to_i

    while guess != price
        puts "tente novamente!!!"
        guess = gets.chomp.to_i
    end
    puts "You Won!"
# 