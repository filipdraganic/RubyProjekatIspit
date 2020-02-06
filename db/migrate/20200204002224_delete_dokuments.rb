class DeleteDokuments < ActiveRecord::Migration[6.0]
  def change
    drop_table :dokuments
  end
end
