class CreateIzmenas < ActiveRecord::Migration[6.0]
  def change
    create_table :izmenas do |t|
      t.string :content
      t.belongs_to :user_id, null: false, foreign_key: true
      t.belongs_to :dokument_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
