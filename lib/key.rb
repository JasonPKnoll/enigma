class Key
    attr_reader :random_number, :a_key, :b_key, :c_key, :d_key

  def initialize
    @random_number = []
    @a_key = 0
    @b_key = 0
    @c_key = 0
    @d_key = 0
  end

  def random_number_generator
    @random_number = (1..9).to_a.shuffle.take(4).unshift(0)
    @a_key = random_number[0].to_s.to_i + random_number[1].to_s.to_i
    @b_key = (random_number[1].to_s.to_i * 10) + random_number[2].to_s.to_i
    @c_key = (random_number[2].to_s.to_i * 10) + random_number[3].to_s.to_i
    @d_key = (random_number[3].to_s.to_i * 10) + random_number[4].to_s.to_i
  end
end
