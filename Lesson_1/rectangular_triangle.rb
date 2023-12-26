arr = []
puts "First side ?"
arr << a = gets.chomp.to_i
puts "Second side ?"
arr << b = gets.chomp.to_i
puts "Third side ?"
arr << c = gets.chomp.to_i

d = arr.sort.last
e = arr.sort[0]
t = arr.sort[1]

  if e**2 + t**2 == d**2
     puts "Rigt triangle"
   elsif a == b && a == c
     puts "This triangle is equilateral and isosceles"
   elsif a == b || b == c || c == a
     puts "This triangle is isosceles"
   else
     puts "This triangle is ordinary"
  end
