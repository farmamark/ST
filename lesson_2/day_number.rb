puts "Enter the number ?"
number = gets.chomp.to_i
puts "Enter the month ?"
month = gets.chomp.to_i
puts "Enter year ?"
year = gets.chomp.to_i


month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
month_day[1] = 29 if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0

count = 0

for i in 0..month-2
   count += month_day[i]
end

count += number

puts count
