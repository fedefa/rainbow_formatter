# frozen_string_literal: true

module Formatter
  module Verbose
    def progress_lines
      [
        format("%-#{terminal_width}s", finished? ? '' : "running: #{example_name}")
      ].concat(super)
    end
  end
end
