# frozen_string_literal: true

require 'configuration'
require 'formatter/common'
require 'rspec/core/formatters/base_text_formatter'
require 'ostruct'
require 'pry'

class RainbowFormatter < RSpec::Core::Formatters::BaseTextFormatter
  include Formatter::Common

  attr_reader :example_name, :ascii_array

  RSpec::Core::Formatters.register self, :example_started, :example_passed, :example_pending,
                                   :example_failed, :start_dump, :start

  def initialize(output)
    super(output)
    singleton_class.send(:include, RainbowFormatter.configuration.custom)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end

  def start(notification)
    # TODO: Lazy fix for specs.
    if notification.is_a?(Integer)
      super(OpenStruct.new(count: notification))
    else
      super(notification)
    end

    @current = @color_index = @passing_count = @failure_count = @pending_count = @animation_index = 0
    @example_results = []
    @failed_examples = []
    @pending_examples = []
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

  def start_dump(_notification)
    @current = @example_count
  end

  def dump_summary(notification)
    duration = notification.duration
    summary = "\nYou've rainbowified for #{format_duration(duration)}\n".split(//).map { |c| rainbowify(c) }
    output.puts summary.join
    output.puts notification.fully_formatted
    dump_commands_to_rerun_failed_examples if respond_to?(:dump_commands_to_rerun_failed_examples)
  end
end
