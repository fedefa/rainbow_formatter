# frozen_string_literal: true

require_relative 'spec/spec_helper'

describe RainbowFormatter do
  before do
    sleep(0.4) # Just to slow it down a little :-)
  end

  100.times do
    it 'passed specs' do
      expect(0).to eql(0)
    end
    it 'pending specs' if [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1].sample == 1
  end
end
