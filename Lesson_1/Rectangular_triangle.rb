puts "What is side a ?"
a = gets.chomp.to_i
puts "What is side b ?"
b = gets.chomp.to_i
puts "What is side c ?"
c = gets.chomp.to_i

  if b**2 + c**2 == a**2 || a**2 + c**2 == b**2 || a**2 + b**2 == c**2
     puts "Rigt triangle"
   elsif a == b && a == c
     puts "This triangle is equilateral and isosceles"
   elsif a == b || b == c || c == a
     puts "This triangle is isosceles"
   else
     puts "This triangle is ordinary"
  end
