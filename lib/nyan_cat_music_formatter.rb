# frozen_string_literal: true

require 'nyan_cat_formatter'
require 'nyan_cat_format/music'

NyanCatMusicFormatter = Class.new(NyanCatFormatter) do
  include NyanCatFormat::Music

  RSpec::Core::Formatters.register(self, :example_passed, :example_pending,
                                   :example_failed, :start_dump, :start)
end
