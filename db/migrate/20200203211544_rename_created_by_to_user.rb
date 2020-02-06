class RenameCreatedByToUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :created_by
  end
end
