class Station
  attr_accessor :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrival(train)
    trains<<train
  end

  def list_trains
    station.trains
  end

  def departure(train)
    trains.delete(train)
  end
end
