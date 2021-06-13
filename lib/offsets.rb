class Offsets
  attr_reader :key, :date, :keys, :date_offsets, :final_offsets

  def initialize(key, date)
    @key = key
    @date = date
    @keys = {}
    @date_offsets = {}
    @final_offsets = {}
  end

  def final_offsets
    @final_offsets = {
      :offset_a => (keys[:a_key] + date_offsets[:a_set]),
      :offset_b => (keys[:b_key] + date_offsets[:b_set]),
      :offset_c => (keys[:c_key] + date_offsets[:c_set]),
      :offset_d => (keys[:d_key] + date_offsets[:d_set])
    }
    require "pry"; binding.pry
  end

  def set_key_offsets
    random_key = (1..9).to_a.shuffle.take(4).unshift(0)
    @keys = {
      :a_key => random_key[0].to_s.to_i + random_key[1].to_s.to_i,
      :b_key => (random_key[1].to_s.to_i * 10) + random_key[2].to_s.to_i,
      :c_key => (random_key[2].to_s.to_i * 10) + random_key[3].to_s.to_i,
      :d_key => (random_key[3].to_s.to_i * 10) + random_key[4].to_s.to_i
    }
  end

  def set_date_offsets
    @date = Time.now.strftime("%d/%m/%y").to_s.delete("/").to_i
    square_date = ((date ** 2).to_s.split('')).last(4)
    @date_offsets = {
      :a_set => square_date[0].to_i,
      :b_set => square_date[1].to_i,
      :c_set => square_date[2].to_i,
      :d_set => square_date[3].to_i
    }
  end

end
