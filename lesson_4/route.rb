class Route

  attr_reader :name, :stations

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

  protected
  attr_writer :stations

end
