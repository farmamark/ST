class Carriage
  include Validatable
  attr_reader :name

  def initialize(name=nil)
    @name = name
    validate!
  end
end
