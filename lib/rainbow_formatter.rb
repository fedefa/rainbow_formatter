# frozen_string_literal: true

require 'formatter/configuration'
require 'formatter/common'
require 'ostruct'
require 'pry'
require 'rspec'

class RainbowFormatter
  include Formatter::Common

  attr_reader :example_name, :ascii_array, :output

  RSpec::Core::Formatters.register self, :start, :example_started, :example_passed, :example_pending, :example_failed,
                                     :start_dump, :dump_summary

  BUNDLED_MODES = {
    tina_bike: Formatter::Custom::TinaBike,
    tina_dream: Formatter::Custom::TinaDream,
    car: Formatter::Custom::Car,
    dog: Formatter::Custom::Dog,
    monkey: Formatter::Custom::Monkey
  }.freeze

  def initialize(output)
    @output = output
    @current = @color_index = @passing_count = @failure_count = @pending_count = @animation_index = 0
    @example_results = []
    @failed_examples = []
    @pending_examples = []
    setup_formatter
  end

  def setup_formatter
    formatter = RainbowFormatter.configuration.formatter
    formatter = BUNDLED_MODES.dig(formatter) unless formatter.is_a?(Module)
    singleton_class.send(:include, formatter)
  end

  def self.configuration
    @configuration ||= Formatter::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end

  def start(start_notification)
    # TODO: Lazy fix for specs.
    @example_count = if start_notification.is_a?(Integer)
                       start_notification
                     else
                       start_notification.count
                     end
  end

  def start_dump(_notification)
    @current = @example_count
  end

  def example_started(notification)
    notification = notification.example if notification.respond_to?(:example)
    @example_name = notification.full_description
  end

  def example_passed(_notification)
    tick
  end

  def example_pending(notification)
    @pending_examples << notification
    @pending_count += 1
    tick(mark: PENDING)
  end

  def example_failed(notification)
    @failed_examples << notification
    @failure_count += 1
    tick(mark: FAIL)
  end

  def dump_failed_summary
    @failed_examples.each do |n|
      output.puts "\n-> #{n.description}\n\n"
      output.puts n.colorized_message_lines
      output.puts "\n --> Exception backtrace: \n\n"
      output.puts n.exception.backtrace.join("\n")
    end
  end

  def dump_summary(notification)
    duration = notification.duration
    summary = "\nYou've rainbowified for #{format_duration(duration)}\n".split(//).map { |c| rainbowify(c) }
    dump_failed_summary
    output.puts notification.colorized_message_lines if notification.respond_to?(:colorized_message_lines)
    output.puts summary.join
    output.puts notification.fully_formatted
    dump_commands_to_rerun_failed_examples if respond_to?(:dump_commands_to_rerun_failed_examples)
  end
end
