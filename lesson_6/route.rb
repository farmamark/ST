class Route
  include InstanceCounter
  include Validatable
  attr_reader :name, :stations

  def initialize(name=nil, first_station, last_station)
    @name = name
    @stations = [first_station,last_station]
    validate!
    register_instance
  end

  def new_st(station)
    stations.insert(1, station)
  end

  def delete(station)
    stations.delete(station)
  end

  private
  attr_writer :stations
end
