# frozen_string_literal: true

# lib/pin_pad_v2.rb
def find_code(path, line = 1, position = 1)
  pin_pad = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  pin_code = []
  path.split.each do |code_line|
    code_line.chars do |a|
      case a
      when 'U'
        line -= 1 if line.positive?
      when 'D'
        line += 1 if line < 2
      when 'L'
        position -= 1 if position.positive?
      when 'R'
        position += 1 if position < 2
      else
        puts 'Incorrect input'
      end
    end
    pin_code << pin_pad[line][position]
  end
  puts pin_code.join
end

# method of use:
road = %(
RLRLLLULULULUUDUULULRDDLURURDDLDUUDDLRDDUUUDD
LDLRLDDDLUDRDRRUDUURLRULLUDDRLURLUULDLLRLLUDLRLRUDLULRLRRL
LLRRDURRDLDULRDUDLRDRDRURULDU
DULRRDRLRLUDLLURURLLRLRDLLDLLDRDUURL
DUULULUUDUDLLRLRURULLDLRRLURDLLDUDUDDRURRLUDULULD
)

find_code(road)
