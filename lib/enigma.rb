require './lib/offsets'
require './modules/indexable'

class Enigma
  include Indexable
  attr_reader :message, :date, :key, :offsets

  def initialize
    @key = @key
    @date = @date
    @message = message
    @offsets = offsets
    @offsets_count = 0
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
        if @offsets_count == 0
          scramble(1, :offset_a, character)
          # @offsets_count += 1
          # start = character_set.find_index(character)
          # finish = @offsets.final_offsets[:offset_a]
          # character_set.rotate(start).rotate(finish)[0]
        elsif @offsets_count == 1
          scramble(1, :offset_b, character)
          # @offsets_count += 1
          # start = character_set.find_index(character)
          # finish = @offsets.final_offsets[:offset_b]
          # character_set.rotate(start).rotate(finish)[0]
        elsif @offsets_count == 2
          scramble(1, :offset_c, character)
          # @offsets_count += 1
          # start = character_set.find_index(character)
          # finish = @offsets.final_offsets[:offset_c]
          # character_set.rotate(start).rotate(finish)[0]
        else @offsets_count == 3
          scramble(0, :offset_d, character)
          # @offsets_count = 0
          # start = character_set.find_index(character)
          # finish = @offsets.final_offsets[:offset_d]
          # character_set.rotate(start).rotate(finish)[0]
        end
      else
        character
      end
    end.join
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
