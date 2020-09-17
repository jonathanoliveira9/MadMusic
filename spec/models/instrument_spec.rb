require 'rails_helper'

RSpec.describe Instrument, type: :model do
  let(:instrument) { create(:instrument) }
  it 'is valid with valid attributes' do
    expect(instrument).to be_valid
  end

  it 'is not valid without a serie' do
    instrument.serie = nil
    expect(instrument).to_not be_valid
  end

  it 'is not valid without a price' do
    instrument.price = nil
    expect(instrument).to_not be_valid
  end

  it 'is valid without description' do
    instrument.description = nil
    expect(instrument).to be_valid
  end

  it 'is not valid without line' do
    instrument.line = nil
    expect(instrument).to_not be_valid
  end
end
