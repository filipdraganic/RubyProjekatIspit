class AddUserToPrimedbas < ActiveRecord::Migration[6.0]
  def change
    remove_column :primedbas , :user_id
  end
end
