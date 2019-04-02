# frozen_string_literal: true

require 'rainbow_formatter'
require 'formatter/verbose'

RainbowVerboseFormatter = Class.new(RainbowFormatter) do
  include Formatter::Verbose

  RSpec::Core::Formatters.register(self, :example_passed, :example_pending, :example_failed, :start_dump, :start)
end
