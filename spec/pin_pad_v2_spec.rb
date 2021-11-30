# frozen_string_literal: true

# spec/pin_pad_v2_spec.rb
require 'pin_pad_v2'
describe 'find_code' do
  let(:road) do
    %(RUU
      DDDL
      URLLL
      )
  end

  it 'puts expected value ' do
    $stdout = StringIO.new
    find_code(road)
    $stdout.rewind
    expect($stdout.gets.strip).to eq('384')
  end
end
