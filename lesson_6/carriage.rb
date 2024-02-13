class Carriage
  include Validable
  attr_reader :name

  def initialize(name=nil)
    @name = name
    validate!
  end
end
