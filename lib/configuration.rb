# frozen_string_literal: true

require 'formatter/custom/car'

class Configuration
  attr_accessor :custom
  def initialize
    @custom = Formatter::Custom::Car
  end
end
