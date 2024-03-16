# frozen_string_literal: true

module Validatable
  NAME_FORMAT = /\A[а-я|\w|\W]{3,}\z/i.freeze
  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  def validate!
    raise NotImplementedError
  end
end
