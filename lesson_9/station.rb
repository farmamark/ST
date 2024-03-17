# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validatable
  extend Accessors
  attr_reader :name, :trains

  @@all = []

  def self.all
    @@all
  end

  attr_accessor_with_history :baza

  validate :name, :presence
  validate :name, :format, NAME_FORMAT


  def initialize(name = nil)
    @name = name
    @trains = []
    @@all << self
    register_instance
  end

  def arrival(train)
    trains << train
  end

  def departure(train)
    trains.delete(train)
  end

  def each_trains(&block)
    trains.each(&block)
  end

  private

  attr_writer :trains

end
