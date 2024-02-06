#require_relative 'main'

class RailWays
  include Konfigable

  def initialize
    @all_stations = []
    @all_trains = []
    @all_route = []
    @all_carriages = []
  end

  def new_station
    puts "Введите навание"
    name = gets.chomp
    station = Station.new(name)
    all_stations<<station
    puts "Новая станция: #{station.name} создана."
  end

  def new_train
    puts "Введите номер/название поезда"
    number = gets.chomp
    puts "Выбирите тип поезда:
    0 - пассажирский
    1 - грузовой"
    type = gets.chomp.to_i
    if type == 0
      train = PassengerTrain.new(number)
      all_trains<<train
      puts "Поезд #{train.number} создан"
    elsif type == 1
      train = CargoTrain.new(number)
      all_trains<<train
      puts "Поезд #{train.number} создан"
    else
      puts "Ошибка"
    end
  end

  def new_route
    puts "Название маршрута ?"
    name = gets.chomp
    show_all_stations
    puts "Введите номер начальной станции"
    first_station = gets.chomp.to_i
    puts "Введите номер конечной станции"
    last_station = gets.chomp.to_i
    route = Route.new(name, all_stations[first_station], all_stations[last_station])
    all_route<<route
    puts "Маршрут #{route.name} создан."
  end

  def delete_station
    show_all_routs
    puts "Введите номер маршрута"
    num = gets.chomp.to_i

    all_route[num].stations.each_with_index do |x, ind|
      puts "#{ind} - #{x.name}"
    end

    puts "Введите номер станции которую хотите удалить"
    num_stat = gets.chomp.to_i

    all_route[num].delete(all_stations[num_stat])
    puts "Готово"
  end

  def add_station_in_route
    show_all_stations
    puts "Введите номе станции которую хотите добавить"
    num_stat = gets.chomp.to_i
    show_all_routs
    puts "Введиет № маршрута в который хотите добавить станцию"
    num_route = gets.chomp.to_i
    all_route[num_route].new_st(all_stations[num_stat])
    puts "Готово"
  end

  def add_route_in_train
    show_all_routs
    puts "Введите № маршрута"
    num_route = gets.chomp.to_i
    show_all_trains
    puts "Введите № поезда"
    num_train = gets.chomp.to_i
    all_trains[num_train].new_routs(all_route[num_route])
  end

  def new_carriage
    puts "Введите название/номер вагон"
    name_carriage = gets.chomp
    puts "Выбирите тип вагона
    0 - пассажирский
    1 - грузовой"
    type_carriage = gets.chomp.to_i

    if type_carriage == 1
      carriage = CargoCarriage.new(name_carriage)
      all_carriages<<carriage
      puts "Вагон #{carriage.name} создан"
    elsif type_carriage == 0
      carriage = PassengerCarriage.new(name_carriage)
      all_carriages<<carriage
      puts "Вагон #{carriage.name} создан"
    else
      puts "Ошибка"
    end
  end

  def add_carriage_to_train
    show_all_carriage
    puts "Вагоны и поезда должны быть одного типа!
    ----------------
    Выбирите вагон"
    num_carriage = gets.chomp.to_i
    show_all_trains
    puts "Выбирите поезд"
    num_train = gets.chomp.to_i

    if all_trains[num_train].attach_carriage(all_carriages[num_carriage])
      puts "Готово"
    else
      puts "Вагоны и поезда должны быть одного типа!"
    end
  end

  def delete_carriage_to_train
    show_all_trains
    puts "Выбирите поезд"
    num_train = gets.chomp.to_i
    all_trains[num_train].carriages.each_with_index {|x, ind| puts "#{ind} - #{x.name}"}
    puts "Выбирите вагон"
    num_carr = gets.chomp.to_i
    all_trains[num_train].unhook_carriage(all_trains[num_train].carriages[num_carr])
    puts "Готово"
  end

  def train_go_next_station
    show_all_trains
    puts "Выбирите поезд"
    num_train = gets.chomp.to_i
    all_trains[num_train].go_next_station
    puts "поезд уехал"
  end

  def train_go_previous_station
    show_all_trains
    puts "Выбирите поезд"
    num_train = gets.chomp.to_i
    all_trains[num_train].go_previous_station
    puts "поезд уехал"
  end

  def list_train_in_station
    show_all_stations
    puts "Выбирите станцию"
    stat = gets.chomp.to_i
    all_stations[stat].trains.each_with_index {|x, v| puts "#{v+1} - #{x.number}"}
  end

  def show_all_stations
    all_stations.each_with_index {|x,v|
      puts "#{v} - #{x.name}"}
  end

  private # Эти методы на прямую не используются,
            # их вызывают другие методы класса.
  attr_accessor :all_stations, :all_trains, :all_route, :all_carriages

  def show_all_trains
    all_trains.each_with_index {|x,i| puts "#{i} - #{x.number} - #{x.class}"}
  end

  def show_all_routs
    all_route.each_with_index do |x, v|
      puts "#{v} - #{x.name}"
    end
  end

  def list_stations_in_route
    show_all_routs
    puts "Введите номер маршрута"
    num = gets.chomp.to_i
    all_route[num].stations.each_with_index do |x, ind|
      puts "#{ind} - #{x.name}"
    end
  end

  def show_all_carriage
    all_carriages.each_with_index {|x,v| puts "#{v} - #{x.name} - #{x.class}"}
  end
end

