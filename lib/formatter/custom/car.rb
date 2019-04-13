# frozen_string_literal: true

module Formatter
  module Custom
    module Car
      # rubocop:disable Metrics/LineLength
      def ascii_array
        ["   -           __\r\n --          ~( @\\   \\  \r\n---   _________]_[__/_>________\r\n     /  ____ \\ <>     |  ____  \\\r\n    =\\_/ __ \\_\\_______|_/ __ \\__D\r\n________(__)_____________(__)____",
         "    -           __\r\n   --         ~( @\\   \\\r\n  ---  _________]_[__/_>________\r\n     /  ____ \\ <>     |  ____  \\\r\n    =\\_/ __ \\_\\_______|_/ __ \\__D\r\n________(__)_____________(__)____"]
      end
      # rubocop:enable Metrics/LineLength

      def rainbow_mp3
        File.expand_path('../../../data/tina_dream.mp3', __dir__)
      end
    end
  end
end
