basket_shop = {}
sum_basket = 0
loop do
  print "Product name or stop: "
  name = gets.chomp
  break if name == "stop"
  print "Price: "
  price = gets.chomp.to_f
  print "Quantity: "
  quantity = gets.chomp.to_f

  basket_shop[name.to_sym] = {price: price, quantity: quantity}
end

puts basket_shop

basket_shop.each do|name, value|
   sum_basket += value[:price] * value[:quantity]
   puts "#{name}: #{value[:price] * value[:quantity]}"
 end

puts sum_basket
