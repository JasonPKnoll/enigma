require 'spec_helper'
require 'offsets'

describe Offsets do
  before(:each) do
    @offset = Offsets.new('02715', '040895')
  end

  it "exists" do
    expect(@offset).to be_a(Offsets)
  end

  it "has attributes" do
    expect(@offset.key).to eq('02715')
    expect(@offset.date).to eq('040895')
    expect(@offset.keys).to eq({})
    expect(@offset.date_offsets).to eq({})
    expect(@offset.final_offsets).to eq({})
  end

  it 'can set key offsets' do
    @offset.set_key_offsets
    @offset.set_date_offsets
    @offset.final_offsets
    expect(@offset.set_key_offsets).to eq(0)
  end
end
