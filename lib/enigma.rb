require './lib/key'
require './lib/date'

class Enigma
  attr_reader :message, :date, :key

  def initialize
    @key = Key.new
    @date = Date.new
    @message = message
  end

  def encrypt(message, key, date)
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
