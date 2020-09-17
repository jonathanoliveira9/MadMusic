class Instrument < ApplicationRecord
  validates :serie, :price, :line, presence: true
  belongs_to :brand
end
