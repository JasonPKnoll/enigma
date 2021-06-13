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
    # expect(@enigma.key).to eq(nil)
    # expect(@enigma.date).to eq(nil)
    # expect(@enigma.message).to eq(nil)
    expect(@enigma.offsets).to eq(nil)
    expect(@enigma.offsets_count).to eq(0)
  end

  it 'has attibutes that can change' do
    @enigma.encrypt("hi", '02715', '040895')
    # expect(@enigma.key).to eq('02715')
    # expect(@enigma.date).to eq('040895')
    # expect(@enigma.message).to eq('hi')
    expect(@enigma.offsets.class).to eq(Offsets)
    expect(@enigma.offsets_count).to eq(2)
  end

  it 'can encrypt' do
    new_encryption = @enigma.encrypt("hEllo woRld!", '02715', '040895')
    expect(new_encryption).to eq("keder ohulw!")
  end

  xit 'decrypt' do
    new_decryption = @enigma.encrypt("keder ohulw!", '02715', '040895')
    expect(new_encryption).to eq("hello world!")
  end

end
