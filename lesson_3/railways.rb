class Station
  attr_accessor :trains, :routs, :cur_st, :next_st, :prev_st
  attr_reader :type

  def initialize(name_stat)
    @name_stat = name_stat
    @trains = []
  end

  def arrival(train)
    @trains<<train
  end

  def list_trains
    @trains.each {|t| puts t.number}
  end

  def list_trains_type
      pass = 0
      cargo = 0
    @trains.each {|w| w.type
        if w.type == "pass"
          pass += 1
        else w.type == "cargo"
          cargo += 1
        end
      }
      puts "Pass: #{pass}"
      puts "Cargo: #{cargo}"
  end

  def departure(train)
    @trains.delete(train)
  end
end

class Route
  attr_accessor :station, :st, :routs, :cur_st, :next_st, :prev_st
  def initialize(first_st, last_st)
    @station = [first_st, last_st]
  end

  def new_st(st)
    @station.insert(1, st)
  end

  def delete(st)
    @station.delete(st)
  end

  def list_stations
    @station.each_with_index {|a, b| puts "#{b+1} - #{a}"}
  end
end

class Train
  attr_reader :number, :type, :station

  attr_accessor :quantity, :speed, :routs, :cur_index, :cur_st, :next_st, :prev_st

  def initialize(number, type, quantity)
    @number = number
    @type = type
    @quantity = quantity
    @speed = 0
  end

  def new_routs(routs)
    @routs = routs
    @cur_index = 0
    cur_st.arrival(self)
  end

  def cur_st
    @routs.station[(@cur_index)]
  end

  def next_st
    if @cur_index == @routs.station.size - 1
      puts "last station"
    else
       @next_st = @routs.station[(@cur_index + 1)]
    end
  end

  def prev_st
    if @cur_index == 0
      puts "this is the first station"
    else
      @prev_st = @routs.station[(@cur_index -1)]
    end
  end

  def go_next_st
    cur_st.departure(self)
    next_st.arrival(self)
    @cur_index += 1
  end

  def go_prev_st
    cur_st.departure(self)
    prev_st.arrival(self)
    @cur_index -= 1
  end

  def stop
    @speed = 0
  end

  def correct_quantity(q)
    if @speed != 0
      puts "imposible"
    elsif q > 0
      @quantity += 1
      puts "Now quantity: #{@quantity}"
    else q < 0
      @quantity -= 1
      puts "Now quantity: #{@quantity}"
    end
  end
end

#st_1 = Station.new("Gdansk")
#st_2 = Station.new("Warsaw")
#st_3 = Station.new("Malbork")
#st_4 = Station.new("Tchew")
#rout_1 = Route.new(st_1, st_2)
#train_1 = Train.new(7, "pass", 10)
#train_2 = Train.new(12, "pass", 12)
#train_3 = Train.new(99, "cargo", 100)
#rout_1.new_st(st_3)
#rout_1.new_st(st_4)
