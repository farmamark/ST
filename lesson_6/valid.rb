module Validatable
  NAME_FORMAT = /\A[а-я|\w|\W]{3,}\z/i
  def valid?
    validate!
    true
  rescue
    false
  end
  private
  def validate!
    raise NotImplementedError if !NAME_FORMAT.match?(name)
  end
end
