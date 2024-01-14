require './route.rb'
require './station.rb'
require './train.rb'

st_1 = Station.new("Gdansk")
st_2 = Station.new("Warsaw")
st_3 = Station.new("Malbork")
st_4 = Station.new("Tchew")
rout_1 = Route.new(st_1, st_2)
train_1 = Train.new(7, "pass", 10)
train_2 = Train.new(12, "pass", 12)
train_3 = Train.new(99, "cargo", 100)
rout_1.new_st(st_3)
rout_1.new_st(st_4)

train_1.move(20)
puts "летим #{train_1.speed}."

train_1.stop
puts "теперь #{train_1.speed}."

st_1.arrival(train_1)

puts st_1.trains


