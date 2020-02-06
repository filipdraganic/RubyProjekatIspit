class RemovePrimedbas < ActiveRecord::Migration[6.0]
  def change
    drop_table :primedbas
  end
end
