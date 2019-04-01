# frozen_string_literal: true

require_relative 'spec/spec_helper'
require 'rainbow_formatter'
require 'stringio'

describe RainbowFormatter do
  before do
    @output = StringIO.new
    @formatter = RainbowFormatter.new(@output)
    @formatter.start(2)
    @example = RSpec::Core::ExampleGroup.describe.example

    @samples = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    sleep(0.1) # Just to slow it down a little :-)
  end

  100.times do |_index|
    it 'should perform passing specs' do
      @formatter.current.should == @samples.sample
    end

    it 'should perform pending specs' do
      pending if @samples.sample == 1
    end
  end
end
