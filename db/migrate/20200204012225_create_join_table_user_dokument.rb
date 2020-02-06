class CreateJoinTableUserDokument < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :dokuments do |t|
      t.index [:user_id, :dokument_id]
      t.index [:dokument_id, :user_id]
    end
  end
end
