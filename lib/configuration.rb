# frozen_string_literal: true

require 'formatter/custom/tina_bike'

class Configuration
  attr_accessor :custom
  def initialize
    @custom = Formatter::Custom::TinaBike
  end
end
