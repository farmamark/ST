# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def instances
      @instances ||= 0
    end

    private

    def instances_plus
      @instances += 1
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.instances
      self.class.send(:instances_plus)
    end
  end
end
