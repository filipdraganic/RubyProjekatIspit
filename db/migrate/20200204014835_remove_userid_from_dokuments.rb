class RemoveUseridFromDokuments < ActiveRecord::Migration[6.0]
  def change
    remove_column :dokuments, :user_id
  end
end
