class CargoCarriage < Train

  attr_reader :name

  def initialize(name)
    @name = name
  end
end
