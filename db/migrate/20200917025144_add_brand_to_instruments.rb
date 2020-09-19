class AddBrandToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_reference :instruments, :brand, foreign_key: true
  end
end
