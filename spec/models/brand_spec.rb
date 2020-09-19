require 'rails_helper'

RSpec.describe Brand, type: :model do
  let(:brand) { create(:brand) }
  it 'is valid with valid attributes' do
    expect(brand).to be_valid
  end

  it 'is not valid without a description' do
    brand.description = nil
    expect(brand).to_not be_valid
  end

  it 'is not valid without a fantasy name' do
    brand.fantasy_name = nil
    expect(brand).to_not be_valid
  end
end
