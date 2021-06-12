require 'spec_helper'
require 'keys'
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

  it 'can encrypt'
  it 'decrypt'
end
