class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :korisniks, :dokuments do |t|
      t.index [:korisnik_id, :dokument_id]
      t.index [:dokument_id, :korisnik_id]
    end
  end
end
