# frozen_string_literal: true

module Validatable
  NAME_FORMAT = /\A[а-я|\w|\W]{3,}\z/i.freeze

  def self.included(base)
    base.extend ClassValidatable
    base.include InstanceValidatable
  end

  module ClassValidatable
    attr_accessor :validations

    def validate(name, typ_valid, *params)
      @validations ||= {}
      self.validations[typ_valid] = {name: name, params: params}
    end
  end

  module InstanceValidatable
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def validate!
      self.class.validations.each do |key, value|
        var = instance_variable_get("@#{value[:name]}")
        send(key, var, *value[:params])
      end
    end

    def presence(value, *param)
      raise 'Имя не может быть пустым' if value.nil? || value.empty?
    end

    def format(value, param)
      raise 'Формат не соответствует заданому' unless param.match?(value.to_s)
    end

    def type(value, param)
      raise 'Klass nie podhodit' unless value.is_a?(param)
    end
  end

end
