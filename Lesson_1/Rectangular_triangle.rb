puts "Longest side ?"
a = gets.chomp.to_i
puts "Second side ?"
b = gets.chomp.to_i
puts "Third side ?"
c = gets.chomp.to_i

  if b**2 + c**2 == a**2
     puts "Rigt triangle"
   elsif a == b && a == c
     puts "This triangle is equilateral and isosceles"
   elsif a == b || b == c || c == a
     puts "This triangle is isosceles"
   else
     puts "This triangle is ordinary"
  end
