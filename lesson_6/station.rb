class Station
  include InstanceCounter
  include Validatable
  attr_reader :name, :trains


  @@all = []

  def self.all
      @@all
  end

  def initialize(name =nil)
    @name = name
    @trains = []
    validate!
    @@all<<self
    register_instance
  end

  def arrival(train)
    trains<<train
  end

  def departure(train)
    trains.delete(train)
  end

  private
  attr_writer :trains
end
