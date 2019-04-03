# frozen_string_literal: true

module Formatter
  module Custom
    module Dog
      # rubocop:disable Metrics/LineLength
      def ascii_array
        ["                  ;~~,__\r\n   :-....,-------'`-'._.'\r\n    `-,,,  ,       ,'~~'\r\n        ; ,'~.__; /\r\n        :|      :|\r\n        `-'     `-'",
         "                  ;~~,__\r\n   :-....,-------'`-'._.'\r\n    `-,,,  ,       ,'~~'\r\n        ; ,'~.__; /--.\r\n        :| :|   :|``(;\r\n        `-'`-'  `-'",
         "                  ;~~,__\r\n   :-....,-------'`-'._.'\r\n    `-,,,  ,       ;'~~'\r\n       ,'_,'~.__; '--.\r\n      //'       ````(;\r\n     `-'",
         "                .--~~,__\r\n   :-....,-------`~~'._.'\r\n    `-,,,  ,_      ;'~U'\r\n     _,-' ,'`-__; '--.\r\n    (_/'~~      ''''(;"]
      end
      # rubocop:enable Metrics/LineLength

      def rainbow_mp3
        File.expand_path('../../../data/rainbow.mp3', __dir__)
      end
    end
  end
end
