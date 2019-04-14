# frozen_string_literal: true

module Formatter
  module Custom
    module TinaBike
      # rubocop:disable Metrics/LineLength
      def ascii_array
        [" -          /\\**/\\    \r\n --       _(  o_o )   \r\n ---   (_/    u--u)   \r\n    /==(    ___||)\r\n   /d\\\"P\\ )=\\d\\\"Pb, \r\n  8 || ===/8=== || 8|  \r\n  P,    ,d P,    ,d`  \r\n    `\"\"\"     `\"\"\"",
         "  -          /\\**/\\     \n  --       _(  o_o )   \n  ---  (_/    u--u)   \n    /==(    ___||)\n   /d\\\"P\\ )=\\d\\\"Pb, \n  8 || ===/8=== || 8|\n  P,    ,d P,    ,d`\n    `\"\"\"     `\"\"\""]
      end
      # rubocop:enable Metrics/LineLength

      def rainbow_mp3
        File.expand_path('../../../data/tina_bike.mp3', __dir__)
      end
    end
  end
end
