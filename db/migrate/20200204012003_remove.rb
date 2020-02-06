class Remove < ActiveRecord::Migration[6.0]
  def change
    drop_table :dokuments_korisniks
  end
end
