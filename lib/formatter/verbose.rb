# frozen_string_literal: true

module Formatter
  module Verbose
    def progress_lines
      label = "running: #{example_name}"
      label = label.slice(0, terminal_width - 3).concat('...') if label.size > terminal_width
      super.concat(
        [
          format("%-#{terminal_width}s", finished? ? '' : label)
        ]
      )
    end
  end
end
