# frozen_string_literal: true

class Carriage
  include Validatable
  attr_reader :name

  def initialize(name, _quantity)
    @name = name
    validate!
  end

  private

  def validate!
    raise 'Имя должно быть не менее 3-х символов' unless NAME_FORMAT.match?(name)
  end
end
