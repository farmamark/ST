puts "What is your name ?"
name = gets.chomp

puts "How tall are you ?"
height = gets.chomp

ideal_weight = (height.to_i - 110)*1.15

if ideal_weight < 0
  puts "Ваш вес уже оптимальный!"
else
  puts "#{name}, ваш вес: #{ideal_weight} кг."
end
