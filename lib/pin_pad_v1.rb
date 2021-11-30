# frozen_string_literal: true

# lib/pin_pad_v1.rb
class PinPad
  Position = Struct.new(:x, :y)

  PIN_PAD_MAP = {
    1 => Position.new(0, 0),
    2 => Position.new(1, 0),
    3 => Position.new(2, 0),
    4 => Position.new(0, 1),
    5 => Position.new(1, 1),
    6 => Position.new(2, 1),
    7 => Position.new(0, 2),
    8 => Position.new(1, 2),
    9 => Position.new(2, 2)
  }.freeze

  MOVE = {
    'U' => Position.new(0, -1),
    'D' => Position.new(0, 1),
    'L' => Position.new(-1, 0),
    'R' => Position.new(1, 0)
  }.freeze

  attr_reader :current_position, :road, :numbers

  def initialize(x  = 1, y = 1, road)
    @current_position = Position.new(x, y)
    @road = road
    @numbers = []
  end

  def calculate_pin
    road.split.each do |path|
      path.split('') do |char|
        move = MOVE[char]
        new_position = Position.new(current_position.x + move.x, current_position.y + move.y)
        @current_position = new_position if PIN_PAD_MAP.value?(new_position)
      end
      @numbers << PIN_PAD_MAP.key(current_position)
    end
    puts numbers.join
  end
end

# method of use:
road = %(
RLRLLLULULULUUDUULULRDDLURURDDLDUUDDLRDDUUUDD
LDLRLDDDLUDRDRRUDUURLRULLUDDRLURLUULDLLRLLUDLRLRUDLULRLRRL
LLRRDURRDLDULRDUDLRDRDRURULDU
DULRRDRLRLUDLLURURLLRLRDLLDLLDRDUURL
DUULULUUDUDLLRLRURULLDLRRLURDLLDUDUDDRURRLUDULULD
)

pin = PinPad.new(road)
pin.calculate_pin
