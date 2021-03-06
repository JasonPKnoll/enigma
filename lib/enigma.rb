require_relative 'offsets'
require_relative './modules/indexable'

class Enigma
  include Indexable
  attr_reader :offsets, :offsets_count

  def initialize
    @offsets = offsets
    @offsets_count = 0
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def set_offsets(key, date)
    @offsets = Offsets.new(key, date)
    offsets.set_key_offsets(key)
    offsets.set_date_offsets(date)
  end

  def encrypt(message, key, date)
    set_offsets(key, date)
    message_to_array = message.downcase.split('')
    message_to_array.map do |character|
      if character_set.include?(character)
        scrambling(character)
      else
        character
      end
    end.join
  end

  def scrambling(character)
    if @offsets_count == 0
      scramble(1, :offset_a, character)
    elsif @offsets_count == 1
      scramble(1, :offset_b, character)
    elsif @offsets_count == 2
      scramble(1, :offset_c, character)
    else @offsets_count == 3
      @offsets_count = 0
      scramble(0, :offset_d, character)
    end
  end

  def decrypt(ciphertext, key, date)
    set_offsets(key, date)
    message_to_array = ciphertext.downcase.split('')
    message_to_array.map do |character|
      if character_set.include?(character)
        unscrambling(character)
      else
        character
      end
    end.join
  end

  def unscrambling(character)
    if @offsets_count == 0
      unscramble(1, :offset_a, character)
    elsif @offsets_count == 1
      unscramble(1, :offset_b, character)
    elsif @offsets_count == 2
      unscramble(1, :offset_c, character)
    else @offsets_count == 3
      @offsets_count = 0
      unscramble(0, :offset_d, character)
    end
  end
end
