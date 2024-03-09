# frozen_string_literal: true

class CargoTrain < Train
  def attach_carriage(carriage)
    super if carriage.is_a?(CargoCarriage)
  end
end
