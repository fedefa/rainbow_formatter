# frozen_string_literal: true

module Formatter
  module InstaFail
    def example_failed(failure)
      output.puts [eol, '', failure.fully_formatted(@failure_count), ''].join("\n")
      super
    end
  end
end
