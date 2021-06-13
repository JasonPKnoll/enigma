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
  end

  def set_key_offsets(new_key)
    if new_key == nil or new_key.length != 5
      key = (1..9).to_a.shuffle.take(4).unshift(0)
    else
      key = new_key
    end
    @keys = {
      :a_key => key[0].to_s.to_i + key[1].to_s.to_i,
      :b_key => (key[1].to_s.to_i * 10) + key[2].to_s.to_i,
      :c_key => (key[2].to_s.to_i * 10) + key[3].to_s.to_i,
      :d_key => (key[3].to_s.to_i * 10) + key[4].to_s.to_i
    }
  end

  def set_date_offsets(new_date)
    if new_date == nil or new_date.length != 6
      date = Time.now.strftime("%d/%m/%y").to_s.delete("/").to_i
    else
      date = new_date
    end
    square_date = ((date.to_i ** 2).to_s.split('')).last(4)
    @date_offsets = {
      :a_set => square_date[0].to_i,
      :b_set => square_date[1].to_i,
      :c_set => square_date[2].to_i,
      :d_set => square_date[3].to_i
    }
  end

end
