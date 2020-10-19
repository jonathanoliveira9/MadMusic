class Brand < ApplicationRecord
  has_many :instruments
  validates :fantasy_name, :description, presence: true
  has_one_attached :picture
  self.per_page = 6
end
