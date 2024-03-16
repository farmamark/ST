# frozen_string_literal: true

class CargoCarriage < Carriage
  attr_accessor :volume, :free_volume

  def initialize(name, quantity)
    super
    @volume = quantity
    @free_volume = @volume
  end

  def fill_the_volume(num)
    self.free_volume -= num
  end

  def occupied_volume
    volume - free_volume
  end
end
