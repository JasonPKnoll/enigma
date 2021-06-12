class Date
    attr_reader :date, :a_offset, :b_offset, :c_offset, :d_offset

  def initialize
    @date = date
    @a_offset = 0
    @b_offset = 0
    @c_offset = 0
    @d_offset = 0
  end

  def get_date
    @date = Time.now.strftime("%d/%m/%y").to_s.delete("/").to_i
    square_date = ((date ** 2).to_s.split('')).last(4)
    @a_offset = square_date[0].to_i
    @b_offset = square_date[1].to_i
    @c_offset = square_date[2].to_i
    @d_offset = square_date[3].to_i
  end
end
