class CreateTranzakcijas < ActiveRecord::Migration[6.0]
  def change
    create_table :tranzakcijas do |t|
      t.belongs_to :user_id, null: false, foreign_key: true
      t.belongs_to :dokument_id, null: false, foreign_key: true
      t.integer :cena

      t.timestamps
    end
  end
end
