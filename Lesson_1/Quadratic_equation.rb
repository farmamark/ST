puts "Enter coefficient a ?"
a = gets.chomp.to_f

puts "Enter coefficient b ?"
b = gets.chomp.to_f

puts "Enter coefficient c ?"
c = gets.chomp.to_f

D = b**2 - (4*a*c)

if D > 0
   x1 = (-b + (Math.sqrt(D))/2*a)
   x2 = (-b - (Math.sqrt(D))/2*a)
   puts "D = #{D},\nx1 = #{x1},\nx2 = #{x2}."
 elsif D == 0 && a != 0
   x = -b/(2*a)
   puts "D = #{D},\nx = #{x}."
 elsif D < 0
   puts "D = #{D},\nNo roots!"
 else
   puts "There is no decision"
end
