class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrival(train)
    trains<<train
  end

  def departure(train)
    trains.delete(train)
  end
end
