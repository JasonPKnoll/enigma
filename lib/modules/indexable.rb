require './lib/enigma'

module Indexable

  def scramble(add_num, offset_abcd, character)
    @offsets_count += add_num
    start = character_set.find_index(character)
    finish = @offsets.final_offsets[offset_abcd]
    character_set.rotate(start).rotate(finish)[0]
  end

  def unscramble(add_num, offset_abcd, character)
    @offsets_count += add_num
    start = character_set.find_index(character)
    finish = @offsets.final_offsets[offset_abcd]
    character_set.rotate(start).rotate(-finish)[0]
  end

end
