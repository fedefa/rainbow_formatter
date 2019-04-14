# frozen_string_literal: true

require 'spec_helper'
require 'stringio'
require 'rainbow_verbose_formatter'

describe RainbowVerboseFormatter do
  before(:all) do
    @output = StringIO.new
    @formatter = described_class.new(@output)
  end

  before(:each) do
    @formatter.start(1)
  end

  it 'displays "running" line with name of test on the last line' do
    expect(@formatter.progress_lines.last).to include('running: ')
  end
end
