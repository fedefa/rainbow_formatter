# frozen_string_literal: true

require 'nyan_cat_formatter'
require 'nyan_cat_format/verbose'

NyanCatVerboseFormatter = Class.new(NyanCatFormatter) do
  include NyanCatFormat::Verbose

  RSpec::Core::Formatters.register(self, :example_passed, :example_pending,
                                   :example_failed, :start_dump, :start)
end
