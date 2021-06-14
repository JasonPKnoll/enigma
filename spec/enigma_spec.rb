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
    expect(@enigma.offsets).to eq(nil)
    expect(@enigma.offsets_count).to eq(0)
  end

  it 'has attibutes that can change' do
    @enigma.encrypt("hi", '02715', '040895')
    expect(@enigma.offsets.class).to eq(Offsets)
    expect(@enigma.offsets_count).to eq(2)
  end

  it 'can encrypt' do
    new_encryption = @enigma.encrypt("hEllo woRld!", '02715', '040895')
    expect(new_encryption).to eq("keder ohulw!")
  end

  it 'decrypt' do
    new_decryption = @enigma.decrypt("keder ohulw!", '02715', '040895')
    expect(new_decryption).to eq("hello world!")
  end

end
