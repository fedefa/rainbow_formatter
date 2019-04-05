# frozen_string_literal: true

module Formatter
  module Verbose
    def progress_lines
      super.concat(
        [
          format("%-#{terminal_width}s", finished? ? '' : "running: #{example_name}")
        ]
      )
    end
  end
end
