# frozen_string_literal: true

require_relative 'spec/spec_helper'

describe RainbowFormatter do
  before do
    sleep(0.5) # Just to slow it down a little :-)
  end

  15.times do
    it 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..' do
      expect(0).to eql(0)
    end
    it 'Another passed' do
      expect(0).to eql(0)
    end

    it 'One failed' do
      expect(0).to eql(1)
    end

    it 'pending specs' if [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1].sample == 1
  end
end
