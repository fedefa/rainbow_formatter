# frozen_string_literal: true

require 'formatter/custom/cat'

class Configuration
  attr_accessor :custom
  def initialize
    @custom = Formatter::Custom::Cat
  end
end
