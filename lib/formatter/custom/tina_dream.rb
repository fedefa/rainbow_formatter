# frozen_string_literal: true

module Formatter
  module Custom
    module TinaDream
      # rubocop:disable Metrics/LineLength
      def ascii_array
        ["                      \r\n     /\\_____/\\\r\n    /  o   o  \\  \r\n   ( ==  ^  == )\r\n    )          (\r\n   (           )\r\n  ( (  )   (  ) )\r\n (__(__)___(__)__)",
         "                      \r\n     /\\_____/\\\r\n    / --   -- \\  \r\n   ( ==  ^  == )\r\n    )          (\r\n   (           )\r\n  ( (  )   (  ) )\r\n (__(__)___(__)__)",
         "                      \r\n     /\\_____/\\\r\n    / --   -- \\  \r\n   ( ==  o  == )\r\n    )          (\r\n   (           )\r\n  ( (  )   (  ) )\r\n (__(__)___(__)__)",
         "         ZzzZ         \r\n     /\\_____/\\\r\n    / --   -- \\  \r\n   ( ==  o  == )\r\n    )          (\r\n   (           )\r\n  ( (  )   (  ) )\r\n (__(__)___(__)__)",
         "          ZzzZz       \r\n     /\\_____/\\\r\n    / --   -- \\  \r\n   ( ==  o  == )\r\n    )          (\r\n   (           )\r\n  ( (  )   (  ) )\r\n (__(__)___(__)__)",
         "          ZzzZzz      \r\n     /\\_____/\\\r\n    / --   -- \\  \r\n   ( ==  o  == )\r\n    )          (\r\n   (           )\r\n  ( (  )   (  ) )\r\n (__(__)___(__)__)",
         "          ZzzZzzZ     \r\n     /\\_____/\\\r\n    / --   -- \\  \r\n   ( ==  o  == )\r\n    )          (\r\n   (           )\r\n  ( (  )   (  ) )\r\n (__(__)___(__)__)",
         "           ZzzZzzZz   \r\n     /\\_____/\\\r\n    / --   -- \\  \r\n   ( ==  o  == )\r\n    )          (\r\n   (           )\r\n  ( (  )   (  ) )\r\n (__(__)___(__)__)",
         "            ZzzZzzZzz \r\n     /\\_____/\\\r\n    / --   -- \\  \r\n   ( ==  o  == )\r\n    )          (\r\n   (           )\r\n  ( (  )   (  ) )\r\n (__(__)___(__)__)",
         "                      \r\n     /\\_____/\\\r\n    /  0   0  \\  \r\n   ( ==  o  == )\r\n    )          (\r\n   (           )\r\n  ( (  )   (  ) )\r\n (__(__)___(__)__)"]
      end
      # rubocop:enable Metrics/LineLength

      def rainbow_mp3
        File.expand_path('../../../data/tina_dream.mp3', __dir__)
      end
    end
  end
end
