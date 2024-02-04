class PassengerTrain < Train

  def attach_carriage(carriage)
    super if carriage.is_a?(PassengerCarriage)
  end

  protected

  attr_writer :speed, :carriages
  attr_accessor :routs, :current_index
end


