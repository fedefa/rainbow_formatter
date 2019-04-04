# frozen_string_literal: true

require 'formatter/custom/monkey'

class Configuration
  attr_accessor :custom
  def initialize
    @custom = Formatter::Custom::Bear
  end
end
