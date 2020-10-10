class Brand < ApplicationRecord
  has_many :instruments
  validates :fantasy_name, :description, presence: true

  self.per_page = 6
end
