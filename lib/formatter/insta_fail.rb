# frozen_string_literal: true

module Formatter
  module InstaFail
    def progress_lines
      # Display last failed example output
      errors_dump = []
      errors_dump.concat(@failed_examples.last.fully_formatted(@failure_count).split("\n")) if @failed_examples.size.positive?
      super.concat(errors_dump)
    end
  end
end
