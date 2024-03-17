# frozen_string_literal: true

class Route
  include InstanceCounter
  include Validatable
  attr_reader :name, :stations

  validate :name, :presence
  validate :stations, :type, Station

  def initialize(name, first_station, last_station)
    @name = name
    @stations = [first_station, last_station]
    register_instance
  end

  def insert_station(station)
    stations.insert(1, station)
  end

  def delete(station)
    stations.delete(station)
  end

  private

  attr_writer :stations
end
