require 'spec_helper'
require 'date'

describe Date do
  before(:each) do
    @date = Date.new
  end

  it 'exists' do
    expect(@date).to be_a(Date)
  end

  it 'has attributes' do
    expect(@date.date).to eq(nil)
  end

  it 'can generate random number' do
    @date.get_date
    expect(@date.date).to be_a(Integer)
  end

  it 'has offsets' do
    @date.get_date
    @date.date = 120621 #=> ["5", "6", "4", "1"]
    expect(@date.a_offset).to eq(5)
    expect(@date.b_offset).to eq(6)
    expect(@date.b_offset).to eq(4)
    expect(@date.b_offset).to eq(1)
  end
end
