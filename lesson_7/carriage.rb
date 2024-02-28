class Carriage
  include Validatable
  attr_reader :name

  def initialize(name, quantity)
    @name = name
    validate!
  end

  private
  def validate!
    raise "Имя должно быть не менее 3-х символов" if !NAME_FORMAT.match?(name)
  end
end
