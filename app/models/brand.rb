class Brand < ApplicationRecord
  has_many :instruments
  validates :fantasy_name, :description, presence: true
  attr_accessor :brand_fantasy_name
  self.per_page = 6
end
