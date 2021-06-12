require 'spec_helper'
require 'key'

describe Key do
  before(:each) do
    @keys = Key.new
  end

  it 'exists' do
    expect(@keys).to be_a(Key)
  end

  it 'has attributes' do
    expect(@keys.random_number).to eq([])
  end

  it 'can generate random number' do
    @keys.set_keys
    expect(@keys.random_number).to eq([2])
  end

  it 'has keys' do
    @keys.set_keys
    expect(@keys.a_key).to eq([2])
    expect(@keys.b_key).to eq([2])
  end
end
