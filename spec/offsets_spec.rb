require 'spec_helper'
require 'offsets'

describe Offsets do
  before(:each) do
    @offset1 = Offsets.new('02715', '040895')
  end

  it "exists" do
    expect(@offset1).to be_a(Offsets)
  end

  it "has attributes" do
    expect(@offset1.key).to eq('02715')
    expect(@offset1.date).to eq('040895')
  end

  it "can set key offsets" do
    @offset1.set_key_offsets(@offset1.key)
    expect(@offset1.keys).to eq({:a_key=>2, :b_key=>27, :c_key=>71, :d_key=>15})
  end

  it "can set date offsets" do
    @offset1.set_date_offsets(@offset1.date)
    expect(@offset1.date_offsets).to eq({:a_set=>1, :b_set=>0, :c_set=>2, :d_set=>5})
  end

  it 'can set final key offsets based on given key and date' do
    @offset1.set_key_offsets('02715')
    @offset1.set_date_offsets('040895')
    @offset1.final_offsets
    expect(@offset1.final_offsets).to eq({
                                          :offset_a=>3,
                                          :offset_b=>27,
                                          :offset_c=>73,
                                          :offset_d=>20
                                          })
  end

  it 'can return current date when no date is given' do
    allow(Time).to receive(:now) {DateTime.new(1999,01,11)}
    @offset1.set_date_offsets('')
    expect(@offset1.date).to eq(110199)
    # expect(@offset1.date).to eq(Time.now.strftime("%d/%m/%y").to_s.delete("/").to_i)
  end


  it 'can generate a random number' do
    @offset1.set_key_offsets('')
    expect(@offset1.key.length).to eq(5)
    expect(@offset1.key[0]).to eq(0)
    allow(@offset1).to receive(:key).and_return('01234')
    @offset1.set_key_offsets('')
    expect(@offset1.keys).to eq({
                                :a_key=>1,
                                :b_key=>12,
                                :c_key=>23,
                                :d_key=>34
                                })
  end
end
