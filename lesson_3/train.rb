class Train
  attr_reader :number, :type

  attr_accessor :quantity, :speed, :routs, :cur_index, :cur_st, :next_st, :prev_st

  def initialize(number, type, quantity)
    @number = number
    @type = type
    @quantity = quantity
    @speed = 0
  end

  def new_routs(routs)
    routs = routs
    cur_index = 0
    cur_st.arrival
  end

  def cur_st
    routs.station[(cur_index)]
  end

  def next_st
    if cur_index == routs.station.size - 1
      return "last station"
    else
       next_st = routs.station[(cur_index + 1)]
    end
  end

  def prev_st
    if cur_index == 0
      return "this is the first station"
    else
      prev_st = routs.station[(cur_index -1)]
    end
  end

  def go_next_st
    cur_st.departure
    next_st.arrival
    cur_index += 1
  end

  def go_prev_st
    cur_st.departure
    prev_st.arrival
    cur_index -= 1
  end

  def stop
    speed = 0
  end
end
