class Instrument < ApplicationRecord
  validates :serie, :price, :line, presence: true
  belongs_to :brand
  has_one_attached :picture

  self.per_page = 9
end
