require 'spec_helper'
require 'offsets'
require 'enigma'

describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end

  it 'has attributes' do
  end

  it 'can get the date' do
  end

  it 'can encrypt' do
    new_encryption = @enigma.encrypt("hEllo woRld", '02715', '040895')
    expect(new_encryption).to eq("keder ohulw")
    require "pry"; binding.pry
  end

  it 'decrypt'
end
