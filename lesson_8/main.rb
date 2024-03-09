# frozen_string_literal: true

TEXT = "
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
       14 - Создать вагон
       15 - Показать список вагонов у поезда
       16 - Занять объем или место в вагоне"

module Konfigable
  def konfig
    loop do
      puts TEXT
      choice = gets.chomp.to_i
      case_konfig(choice)
      break if choice == 13
    end
  end

  def case_konfig(choice)
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
    when 15
      show_all_carriages_in_train
    when 16
      change_volume_or_places_in_carriage
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
