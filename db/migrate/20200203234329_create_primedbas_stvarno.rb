class CreatePrimedbasStvarno < ActiveRecord::Migration[6.0]
  def change
    create_table :primedbas do |t|
      t.string :title
      t.string :content
      t.belongs_to :dokument_id, null: false, foreign_key: true
      t.belongs_to :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
