class AddSlugToResearchers < ActiveRecord::Migration[6.1]
  def change
    add_column :researchers, :slug, :string
    add_index :researchers, :slug, unique: true
  end
end
