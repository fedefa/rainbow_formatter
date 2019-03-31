# frozen_string_literal: true

require 'nyan_cat_formatter'
require 'nyan_cat_format/wide'

NyanCatWideFormatter = Class.new(NyanCatFormatter) do
  include NyanCatFormat::Wide

  RSpec::Core::Formatters.register(self, :example_passed, :example_pending,
                                   :example_failed, :start_dump, :start)
end
