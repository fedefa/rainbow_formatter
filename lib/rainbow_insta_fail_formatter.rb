# frozen_string_literal: true

require 'rainbow_formatter'
require 'formatter/insta_fail'

RainbowInstaFailFormatter = Class.new(RainbowFormatter) do
  include Formatter::InstaFail

  RSpec::Core::Formatters.register(self, :example_passed, :example_pending, :example_failed, :start_dump, :start)
end
