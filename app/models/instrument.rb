class Instrument < ApplicationRecord
  validates :serie, :price, :line, presence: true
end
