# frozen_string_literal: true

class Configuration
  attr_accessor :ascii_array

  def initialize
    @ascii_array =
      [['        _',
        "       / \\      _-'",
        "     _/|  \\-''- _ /",
        "__-' { |          \\",
        '    /             \\',
        '    /       "o.  |o }',
        '    |            \\ ;',
        "                  ',",
        '       \\_         __\\',
        "         ''-_    \\.//",
        "           / '-____'",
        '          /',
        "        _'",
        "      _-'"]]
  end
end
