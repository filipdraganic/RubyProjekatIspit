class CreateOrganizacijas < ActiveRecord::Migration[6.0]
  def change
    create_table :organizacijas do |t|
      t.string :ime
      t.string :opisKompanije
      t.integer :brojClanova

      t.timestamps
    end
  end
end
