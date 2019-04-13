# frozen_string_literal: true

module Formatter
  module Custom
    module Monkey
      # rubocop:disable Metrics/LineLength
      def ascii_array
        ["      .-\"-. \r\n    _/.-.-.\\\r\n   /|( o o )|\\\r\n  | //  \"  \\\\ |\r\n / / \\'---'/ \\ \\\r\n \\ \\_/`\"\"\"`\\_/ /\r\n  \\           /",
         "      .-\"-.\r\n    _/_-.-_\\\r\n   / __} {__ \\\r\n  / //  \"  \\\\ \\\r\n / / \\'---'/ \\ \\\r\n \\ \\_/`\"\"\"`\\_/ /\r\n  \\           /"]
      end
      # rubocop:enable Metrics/LineLength

      def rainbow_mp3
        File.expand_path('../../../data/tina_dream.mp3', __dir__)
      end
    end
  end
end
