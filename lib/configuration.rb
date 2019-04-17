# frozen_string_literal: true

require 'formatter/custom/car'
require 'formatter/custom/dog'
require 'formatter/custom/monkey'
require 'formatter/custom/tina_bike'
require 'formatter/custom/tina_dream'

class Configuration
  attr_accessor :formatter

  def initialize
    @formatter = Formatter::Custom::TinaBike
  end
end
