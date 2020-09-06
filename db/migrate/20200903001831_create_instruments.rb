class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :serie
      t.text   :description
      t.string :line
      t.string :price
      t.timestamps
    end
  end
end
