class Train

  attr_reader :number, :carriages
  attr_accessor :current_station, :next_station, :previous_station

  def initialize(number)
    @number = number
    @carriages = []
    @speed = 0
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
    self.carriages<<carriage
  end

  def unhook_carriage(carriage)
    self.carriages.delete(carriage)
  end

  protected

  attr_writer :carriages
  attr_accessor :routs, :current_index, :speed

end
