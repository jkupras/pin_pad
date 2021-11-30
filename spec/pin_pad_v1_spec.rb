# frozen_string_literal: true

# spec/pin_pad_v1_spec.rb
require 'pin_pad_v1'
describe PinPad do
  let(:road) do
    %(RUU
      DDDL
      URLLL
      )
  end
  let(:pin) { PinPad.new(road) }

  it 'puts expected value' do
    $stdout = StringIO.new
    pin.calculate_pin
    $stdout.rewind
    expect($stdout.gets.strip).to eq('384')
  end
  context 'start from default position' do
    it 'x value is correct' do
      expect(pin.current_position.x).to eq(1)
    end
    it 'y value is correct' do
      expect(pin.current_position.y).to eq(1)
    end
  end
end
