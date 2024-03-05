class PassengerCarriage < Carriage
  attr_accessor :number_of_seats, :free_places
  def initialize(name, quantity)
    super
    @number_of_seats = quantity
    @free_places = @number_of_seats
  end

  def take_the_place
    self.free_places -= 1
  end
  def occupied_places
    number_of_seats - free_places
  end
end

