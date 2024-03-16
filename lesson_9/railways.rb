# frozen_string_literal: true

# require_relative 'main'

class RailWays
  include Konfigable

  private

  attr_accessor :all_stations, :all_trains, :all_route, :all_carriages

  def initialize
    @all_stations = []
    @all_trains = []
    @all_route = []
    @all_carriages = []
  end

  def new_station
    puts 'Введите навание'
    name = gets.chomp
    station = Station.new(name)
    all_stations << station
    puts "Новая станция: #{station.name} создана."
  rescue RuntimeError
    puts 'Имя должно быть не менее 3-х символов'
    retry
  end

  def new_train
    puts 'Введите номер/название поезда в формате ххх-хх/ххххх'
    number = gets.chomp
    puts "Выбирите тип поезда:
    0 - пассажирский
    1 - грузовой"
    type = gets.chomp.to_i
    if type.zero?
      train = PassengerTrain.new(number)
      all_trains << train
      puts "Поезд #{train.number} создан"
    elsif type == 1
      train = CargoTrain.new(number)
      all_trains << train
      puts "Поезд #{train.number} создан"
    else
      puts 'Не выбран тип поезада. Поезд не создан'
    end
  rescue RuntimeError
    puts 'Номер поезда не соответсвует формату'
    retry
  end

  def new_route
    puts 'Название маршрута ?'
    name = gets.chomp
    show_all_stations
    puts 'Введите номер начальной станции'
    first_station = gets.chomp.to_i
    puts 'Введите номер конечной станции'
    last_station = gets.chomp.to_i
    route = Route.new(name, all_stations[first_station], all_stations[last_station])
    all_route << route
    puts "Маршрут #{route.name} создан."
  rescue RuntimeError
    puts 'Имя должно быть не менее 3-х символов'
    retry
  end

  def delete_station
    show_all_routs
    puts 'Введите номер маршрута'
    num = gets.chomp.to_i

    all_route[num].stations.each_with_index do |x, ind|
      puts "#{ind} - #{x.name}"
    end

    puts 'Введите номер станции которую хотите удалить'
    num_stat = gets.chomp.to_i

    all_route[num].delete(all_stations[num_stat])
    puts 'Готово'
  end

  def add_station_in_route
    show_all_stations
    puts 'Введите номе станции которую хотите добавить'
    num_stat = gets.chomp.to_i
    show_all_routs
    puts 'Введиет № маршрута в который хотите добавить станцию'
    num_route = gets.chomp.to_i
    all_route[num_route].insert_station(all_stations[num_stat])
    puts 'Готово'
  end

  def add_route_in_train
    show_all_routs
    puts 'Введите № маршрута'
    num_route = gets.chomp.to_i
    show_all_trains
    puts 'Введите № поезда'
    num_train = gets.chomp.to_i
    all_trains[num_train].new_routs(all_route[num_route])
  end

  def new_carriage
    puts 'Введите название/номер вагон'
    name_carriage = gets.chomp
    puts "Выбирите тип вагона
    0 - пассажирский
    1 - грузовой"
    type_carriage = gets.chomp.to_i
    puts 'Введите количество мест или объем вагона'
    quantity = gets.chomp.to_i

    if type_carriage == 1
      carriage = CargoCarriage.new(name_carriage, quantity)
      all_carriages << carriage
      puts "Вагон #{carriage.name} создан"
    elsif type_carriage.zero?
      carriage = PassengerCarriage.new(name_carriage, quantity)
      all_carriages << carriage
      puts "Вагон #{carriage.name} создан"
    else
      puts 'Ошибка'
    end
  rescue RuntimeError
    puts 'Имя должно быть не менее 3-х символов'
    retry
  end

  def add_carriage_to_train
    show_all_carriage
    puts "Вагоны и поезда должны быть одного типа!
    ----------------
    Выбирите вагон"
    num_carriage = gets.chomp.to_i
    show_all_trains
    puts 'Выбирите поезд'
    num_train = gets.chomp.to_i

    if all_trains[num_train].attach_carriage(all_carriages[num_carriage])
      puts 'Готово'
    else
      puts 'Вагоны и поезда должны быть одного типа!'
    end
  end

  def delete_carriage_to_train
    show_all_trains
    puts 'Выбирите поезд'
    num_train = gets.chomp.to_i
    all_trains[num_train].carriages.each_with_index { |x, ind| puts "#{ind} - #{x.name}" }
    puts 'Выбирите вагон'
    num_carr = gets.chomp.to_i
    all_trains[num_train].unhook_carriage(all_trains[num_train].carriages[num_carr])
    puts 'Готово'
  end

  def train_go_next_station
    show_all_trains
    puts 'Выбирите поезд'
    num_train = gets.chomp.to_i
    all_trains[num_train].go_next_station
    puts 'поезд уехал'
  end

  def train_go_previous_station
    show_all_trains
    puts 'Выбирите поезд'
    num_train = gets.chomp.to_i
    all_trains[num_train].go_previous_station
    puts 'поезд уехал'
  end

  def list_train_in_station
    show_all_stations
    puts 'Выбирите станцию'
    stat = gets.chomp.to_i
    all_stations[stat].each_trains do |train|
      puts "#{train.number} - #{train.class} - #{train.carriages.size}"
    end
  end

  def show_all_stations
    all_stations.each_with_index do |x, v|
      puts "#{v} - #{x.name}"
    end
  end

  def show_all_carriages_in_train
    puts 'Выбирите поезд'
    show_all_trains
    train = gets.chomp.to_i
    all_trains[train].each_carriages do |c|
      if c.is_a?(PassengerTrain)
        puts "#{c.name} - Пассажирский - #{c.free_places}/#{c.occupied_places}"
      else
        puts "#{c.name} - Грузовой - #{c.free_volume}/#{c.occupied_volume}"
      end
    end
  end

  def show_all_trains
    all_trains.each_with_index { |x, i| puts "#{i} - #{x.number} - #{x.class}" }
  end

  def show_all_routs
    all_route.each_with_index do |x, v|
      puts "#{v} - #{x.name}"
    end
  end

  def list_stations_in_route
    show_all_routs
    puts 'Введите номер маршрута'
    num = gets.chomp.to_i
    all_route[num].stations.each_with_index do |x, ind|
      puts "#{ind} - #{x.name}"
    end
  end

  def show_all_carriage
    all_carriages.each_with_index { |x, v| puts "#{v} - #{x.name} - #{x.class}" }
  end

  def change_volume_or_places_in_carriage
    puts 'Выбирите вагон'
    show_all_carriage
    carr = gets.chomp.to_i
    if all_carriages[carr].is_a?(PassengerCarriage)
      all_carriages[carr].take_the_place
      puts '1 место было заянято'
    else
      puts 'Введите объем который хотите заполнить'
      quantity = gets.chomp.to_i
      all_carriages[carr].fill_the_volume(quantity)
      puts 'Готово'
    end
  end
end
