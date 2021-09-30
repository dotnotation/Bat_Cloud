class AddSlugToBats < ActiveRecord::Migration[6.1]
  def change
    add_column :bats, :slug, :string
    add_index :bats, :slug, unique: true
  end
end
