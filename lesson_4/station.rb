class Station

  attr_reader :name, :trains

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

  protected
  attr_writer :trains
end
