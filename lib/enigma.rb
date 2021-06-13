require './lib/key'
require './lib/date'

class Enigma
  attr_reader :message, :date, :key, :offsets

  def initialize
    @key = Key.new
    @date = Date.new
    @message = message
    @offsets = offsets
    @offsets_count = 0
  end

  def final_offsets(key, date)
    @offsets = Offsets(key, date)
    offset_a =
  end

  def encrypt(message, key, date)
    final_offset(key, date)
    message_to_array = message.downcase.split('')
    message_to_array.map do |character|
      if offsets_count = 0
        character_set.find_index(character)
        offsets_count += 1
      elsif offsets_count = 1
        character
        offsets_count += 1
      elsif offsets_count = 2
        character
        offsets_count += 1
      else offsets_count = 3
        character
        @offsets_count = 0
      end
    end
  end

  def decrypt(ciphertext, key, date)
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def user_input
    input = gets.chomp.downcase
    puts input
    user_input
  end
end
