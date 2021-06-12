require 'spec_helper'
require 'key'
require 'date'
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
    @enigma.date.get_date
    @enigma.date.date
  end

  it 'can encrypt'
  it 'decrypt'
end
