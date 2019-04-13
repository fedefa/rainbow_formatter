# frozen_string_literal: true

module Formatter
  module Custom
    module TinaBike
      # rubocop:disable Metrics/LineLength
      def ascii_array
        [" -          /\\**/\\    \n --       _(  o_o )   \n       (_/    u--u)   \n    /==(    ___||)\n   /d\\\"P\\ )=\\d\\\"Pb, \n  8 || ===/8=== || 8|\n  P,    ,d P,    ,d`\n    `\"\"\"     `\"\"\"",
         " --          /\\**/\\    \n ---       _(  o_o )   \n       (_/    u--u)   \n    /==(    ___||)\n   /d\\\"P\\ )=\\d\\\"Pb, \n  8 || ===/8=== || 8|\n  P,    ,d P,    ,d`\n    `\"\"\"     `\"\"\""]
      end
      # rubocop:enable Metrics/LineLength

      def rainbow_mp3
        File.expand_path('../../../data/tina_bike.mp3', __dir__)
      end
    end
  end
end
