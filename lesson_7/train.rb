require_relative 'instance_counter'
class Train
  include Company, InstanceCounter, Validatable
  attr_reader :number, :carriages
  attr_accessor :current_station, :next_station, :previous_station
  FORMAT_NUMBER = /\A[а-я|\w]{3}-?[а-я\w]{2}\z/i

  @@all_trains = {}

  def self.find(number)
    @@all_trains[number]
  end

  def initialize(number=nil)
    @number = number
    validate!
    @carriages = []
    @speed = 0
    @@all_trains[@number] = self
    register_instance
  end

  def new_routs(rout)
    @routs = rout
    @current_index = 0
    current_station.arrival(self)
  end

  def current_station
    routs.stations[current_index]
  end

  def next_station
    if current_index == routs.stations.size - 1
      return
    else
       next_station = routs.stations[(current_index + 1)]
    end
  end

  def previous_station
    if current_index == 0
      return
    else
      previous_station = routs.stations[(current_index - 1)]
    end
  end

  def go_next_station
    current_station.departure(self)
    next_station.arrival(self)
    self.current_index += 1
  end

  def go_previous_station
    current_station.departure(self)
    previous_station.arrival(self)
    self.current_index -= 1
  end

  def stop
    self.speed = 0
  end

  def move(q)
    self.speed = q
  end

  def attach_carriage(carriage)
    self.carriages << carriage
  end

  def unhook_carriage(carriage)
    self.carriages.delete(carriage)
  end

  def each_carriages(&block)
    carriages.each {|carriage| yield(carriage)}
  end

  private

  attr_writer :carriages
  attr_accessor :routs, :current_index, :speed

  def validate!
    raise "надо указать номер" if number.nil?
    raise "Формат номер долежн быть ххх-хх или ххххх" if !FORMAT_NUMBER.match?(number)
  end
end
