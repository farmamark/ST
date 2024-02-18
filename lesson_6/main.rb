module Konfigable
  def konfig
    loop do
      puts "
       1 - Создать станцию
       2 - Сздать поезд
       3 - Создать маршрут
       4 - Удалить станцию из марщрута
       5 - Добавить стацнию в маршрут
       6 - Назначит маршрут поезду
       7 - Добавить вагон к поезду
       8 - Отцепить вагон от поезда
       9 - Переместить поезд вперед по маршруту
       10 - Переместить поезд назад по маршруту
       11 - Показть список станций
       12 - Показать список поездов на станции
       13 - Выход
       14 - Создать вагон"

      choice = gets.chomp.to_i

       case choice
        when 1
         new_station
        when 2
          new_train
        when 3
          new_route
        when 4
          delete_station
        when 5
          add_station_in_route
        when 6
          add_route_in_train
        when 7
          add_carriage_to_train
        when 8
          delete_carriage_to_train
        when 9
          train_go_next_station
        when 10
          train_go_previous_station
        when 11
          show_all_stations
        when 12
          list_train_in_station
        when 14
          new_carriage
       end
     break if choice == 13
    end
  end
end

require_relative 'valid'
require_relative 'carriage'
require_relative 'instance_counter'
require_relative 'company'
require_relative 'railways'
require_relative 'route'
require_relative 'train'
require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'

x = RailWays.new
x.konfig
