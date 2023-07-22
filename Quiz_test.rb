puts "====================== Multiply Array =========================="
def multiply
  numbers = [1, 2, 3, 4]
  total = 1

  numbers.each do |number|
    total *= number
    puts total
  end
  puts "Total: #{total}"
end
puts multiply

puts "====================== IF ELSE =========================="

age = 15
if age >= 18
  puts "pode dirigir"
else
  puts "Sua idade e: #{age} Não pode dirigir"
end

puts "====================== Grades =========================="

grades = [19, 8, 11, 15, 13]
sum = 0

grades.each do |grade|
  sum += grade
end

average = sum.to_f / grades.size
puts average

puts "====================== Capitalize =========================="

def capitalize_name(first_name, last_name)
  puts "#{first_name.capitalize} #{last_name.upcase}"
end

puts capitalize_name("victor", "silva")

puts "====================== Concatenation & Interpolation =========================="
# Concatenation
puts "Le" + " " + "Wagon"

# Interpolation
puts "#{"le"} #{"wagon".upcase}"

puts "====================== Array - Add- Delete =========================="

fruits = ["banana", "peach", "watermelon", "orange"]

fruits[1]

fruits << "apple"
fruits.push[4] = "apple"

#Aqui faz a subtistuicao da INDEX 2 por "PEAR"
fruits[2] = "pear"

fruits.delete_at(-2)
p fruits

puts "====================== Symbol =========================="

city = { name: " Paris", population: 2000000 }

city[ :name ]

city[ :monument ] = " Eiffel Tower"

city[ :population ] =  2000001
city[ :population ] += 1

p city[:mayor]
p city

puts "=========================== Array to HASH ============================="
puts "====================== O MAP modifica o ARRAY ========================="

students = [ [ "john", 28 ], [ "mary", 25 ], [ "paul", 21 ] ]

new_students = students.map do |student|
  { name: student[0] , age: student[1] }
end

p new_students

puts "====================== FINAL ========================="