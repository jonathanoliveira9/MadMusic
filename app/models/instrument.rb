class Instrument < ApplicationRecord
  validates :serie, :price, :line, presence: true
  belongs_to :brand

  self.per_page = 9
end
