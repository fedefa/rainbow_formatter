# frozen_string_literal: true

require 'pry'

module Formatter
  module Common
    ESC      = "\e["
    NND      = "#{ESC}0m"
    PASS     = '='
    PASS_ARY = ['-', '_'].freeze
    FAIL     = '*'
    ERROR    = '!'
    PENDING  = '+'

    VT100_CODES =
      {
        black: 30,
        red: 31,
        green: 32,
        yellow: 33,
        blue: 34,
        magenta: 35,
        cyan: 36,
        white: 37,
        bold: 1
      }.freeze

    VT100_CODE_VALUES = VT100_CODES.invert

    def self.included(base)
      base.class_eval do
        attr_reader :current, :example_results, :color_index, :pending_count, :failure_count, :example_count
      end
    end

    # Increments the example count and displays the current progress
    #
    # @returns nothing
    def tick(mark: PASS)
      @example_results << mark
      @current = @current > @example_count ? @example_count : @current + 1
      @animation_index = (@animation_index + 1) % ascii_array.size
      dump_progress
    end

    # Determine which Ascii to display.
    #
    # @return [String] Ascii to display
    def ascii_to_display
      ascii_array[@animation_index % ascii_array.size]
    end

    # Displays the current progress in all Rainbow glory
    #
    # @return nothing
    def dump_progress
      output.print(progress_lines.join("\n") + eol)
    end

    # Determines line by line tail plus score output
    #
    # @return [Array]
    def progress_lines
      rainbow_trails = rainbow_trail.split("\n")
      [
        rainbow_trails.each_with_index.inject([]) do |result, (trail, index)|
          value = trail_progress_line_score(index)
          result << "#{value} #{trail}"
        end
      ].flatten
    end

    def trail_progress_line_score(trail_index)
      if scoreboard[trail_index]
        "#{scoreboard[trail_index]}/#{@example_count}:"
      else
        ' ' * "#{scoreboard[0]}/#{@example_count}:".size
      end
    end

    # Determines how we end the trail line. If complete, return a newline etc.
    #
    # @return [String]
    def eol
      return "\n" if @current == @example_count

      length = progress_lines.length - 1
      length.positive? ? format("\e[1A" * length + "\r") : "\r"
    end

    # Calculates the current flight length
    #
    # @return [Fixnum]
    def current_width
      # padding_width + example_width + ascii_length
      padding_width + (@current * example_width) + ascii_length
    end

    # Gets the padding for the current example count
    #
    # @return [Fixnum]
    def padding_width
      @example_count.to_s.length * 2 + 6
    end

    # A Unix trick using stty to get the console columns
    #
    # @return [Fixnum]
    def terminal_width
      default_width = if defined? JRUBY_VERSION
                        80
                      else
                        `stty size`.split.map(&:to_i).reverse.first - 1
                      end
      @terminal_width ||= default_width
    end

    # Creates a data store of pass, failed, and pending example results
    # We have to pad the results here because sprintf can't properly pad color
    #
    # @return [Array]
    def scoreboard
      @pending_examples ||= []
      @failed_examples ||= []
      padding = @example_count.to_s.length
      [@current.to_s.rjust(padding),
       success_color((@current - @pending_examples.size - @failed_examples.size).to_s.rjust(padding)),
       pending_color(@pending_examples.size.to_s.rjust(padding)),
       failure_color(@failed_examples.size.to_s.rjust(padding))]
    end

    # Creates a rainbow trail
    #
    # @return [String] the sprintf format of the Nyan cat
    def rainbow_trail
      marks = @example_results.each_with_index.map { |mark, i| highlight(mark) * example_width(i) }
      marks.shift(current_width - terminal_width) if current_width >= terminal_width
      ascii_to_display.split("\n").each_with_index.map do |line, _index|
        "#{marks.join}#{line}"
      end.join("\n")
    end

    # Times a mark has to be repeated
    def example_width(_item = 1)
      1
    end

    # Colorizes the string with raindow colors of the rainbow
    #
    # @params string [String]
    # @return [String]
    def rainbowify(string)
      c = colors[@color_index % colors.size]
      @color_index += 1
      "#{ESC}38;5;#{c}m#{string}#{NND}"
    end

    # Calculates the colors of the rainbow
    #
    # @return [Array]
    def colors
      @colors ||= (0...(6 * 7)).map do |n|
        pi_3 = Math::PI / 3
        n *= 1.0 / 6
        r  = (3 * Math.sin(n) + 3).to_i
        g  = (3 * Math.sin(n + 2 * pi_3) + 3).to_i
        b  = (3 * Math.sin(n + 4 * pi_3) + 3).to_i
        36 * r + 6 * g + b + 16
      end
    end

    # Determines how to color the example.  If pass, it is rainbowified, otherwise
    # we assign red if failed or yellow if an error occurred.
    #
    # @return [String]
    def highlight(mark = PASS)
      case mark
      when PASS then rainbowify PASS_ARY[@color_index % 2]
      when FAIL then "\e[31m#{mark}\e[0m"
      when ERROR then "\e[33m#{mark}\e[0m"
      when PENDING then "\e[33m#{mark}\e[0m"
      else mark
      end
    end

    # Converts a float of seconds into a minutes/seconds string
    #
    # @return [String]
    def format_duration(duration)
      seconds = ((duration % 60) * 100.0).round / 100.0   # 1.8.7 safe .round(2)
      seconds = seconds.to_i if seconds.to_i == seconds   # drop that zero if it's not needed

      message = "#{seconds} second#{seconds == 1 ? '' : 's'}"
      message = "#{(duration / 60).to_i} minute#{(duration / 60).to_i == 1 ? '' : 's'} and " + message if duration >= 60

      message
    end

    # Determines if the specs have completed
    #
    # @returns [Boolean] true if finished; false otherwise
    def finished?
      (@current == @example_count)
    end

    # Determines if the any specs failed or are in pending state
    #
    # @returns [Boolean] true if failed or pending; false otherwise
    def failed_or_pending?
      (@failure_count.to_i.positive? || @pending_count.to_i.positive?)
    end

    # Returns the ascii length
    #
    # @returns [Fixnum]
    def ascii_length
      ascii_to_display.split("\n").group_by(&:size).max.first
    end

    def success_color(text)
      wrap(text, :green)
    end

    def pending_color(text)
      wrap(text, :yellow)
    end

    def failure_color(text)
      wrap(text, :red)
    end

    def console_code_for(code_or_symbol)
      if VT100_CODE_VALUES.key?(code_or_symbol)
        code_or_symbol
      else
        VT100_CODES.fetch(code_or_symbol) do
          console_code_for(:white)
        end
      end
    end

    def wrap(text, code_or_symbol)
      if RSpec.configuration.color_enabled?
        "\e[#{console_code_for(code_or_symbol)}m#{text}\e[0m"
      else
        text
      end
    end
  end
end
