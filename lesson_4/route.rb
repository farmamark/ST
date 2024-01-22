class Route
  attr_accessor :stations
  attr_reader :name

  def initialize(name, first_station, last_station)
    @name = name
    @stations = [first_station,last_station]
  end

  def new_st(station)
    stations.insert(1, station)
  end

  def delete(station)
    stations.delete(station)
  end
end
