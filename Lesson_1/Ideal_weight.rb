puts "What is your name ?"
name = gets.chomp

puts "How tall are you ?"
height = gets.chomp

ideal_weight = (height.to_i - 110)*1.15

puts "#{name}, ваш вес: #{ideal_weight} кг."
puts "Ваш вес уже оптимальный!" if ideal_weight < 0
