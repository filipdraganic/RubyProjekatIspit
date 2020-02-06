class AddUserToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :created_by, :user
    add_reference :posts, :user, foreign_key: true
  end
end
