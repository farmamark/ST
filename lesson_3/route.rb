class Route
  attr_accessor :stations, :station

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def new_st(station)
    stations.insert(1, station)
  end

  def delete(station)
    stations.delete(station)
  end

  def list_stations
    stations
  end
end
