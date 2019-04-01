# frozen_string_literal: true

require 'rainbow_formatter'
require 'formatter/wide'
require 'formatter/music'

RainbowWideMusicFormatter = Class.new(RainbowFormatter) do
  include Formatter::Wide
  include Formatter::Music

  RSpec::Core::Formatters.register(self, :example_passed, :example_pending,
                                   :example_failed, :start_dump, :start)
end
