class AddTitleToIzmenas < ActiveRecord::Migration[6.0]
  def change
    add_column :izmenas , :title, :string
  end
end
