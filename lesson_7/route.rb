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

  def insert_station(station)
    stations.insert(1, station)
  end

  def delete(station)
    stations.delete(station)
  end

  private
  attr_writer :stations

  def validate!
    raise "Имя должно быть не менее 3-х символов" if !NAME_FORMAT.match?(name)
  end
end
