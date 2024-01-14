class Train
  attr_reader :number, :type

  attr_accessor :quantity, :speed, :routs, :current_index, :current_station, :next_station, :previous_station

  def initialize(number, type, quantity)
    @number = number
    @type = type
    @quantity = quantity
    @speed = 0
  end

  def new_routs(routs)
    routs = routs
    current_index = 0
    current_station.arrival
  end

  def current_station
    routs.station[(current_index)]
  end

  def next_station
    if current_index == routs.station.size - 1
      return "last station"
    else
       next_station = routs.station[(current_index + 1)]
    end
  end

  def previous_stations
    if current_index == 0
      return "this is the first station"
    else
      previous_station = routs.station[(current_index -1)]
    end
  end

  def go_next_station
    current_station.departure
    next_station.arrival
    current_station += 1
  end

  def go_prev_st
    current_station.departure
    previous_station.arrival
    current_station -= 1
  end

  def stop
    self.speed = 0
  end

  def move(q)
    self.speed = q
  end
end
