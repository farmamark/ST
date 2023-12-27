puts "First side ?"
a = gets.chomp.to_i
puts "Second side ?"
b = gets.chomp.to_i
puts "Third side ?"
c = gets.chomp.to_i

arr = [a, b, c]
sorted_array = arr.sort
hypotenuse = sorted_array[-1]
first_leg = sorted_array[0]
second_leg = sorted_array[1]

  if second_leg**2 + first_leg**2 == hypotenuse**2
     puts "Rigt triangle"
   elsif a == b && a == c
     puts "This triangle is equilateral and isosceles"
   elsif a == b || b == c || c == a
     puts "This triangle is isosceles"
   else
     puts "This triangle is ordinary"
  end
