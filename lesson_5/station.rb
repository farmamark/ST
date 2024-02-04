class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@all = []

  def self.all
      @@all
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all<<self
    register_instance
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
