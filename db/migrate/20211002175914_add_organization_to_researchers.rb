class AddOrganizationToResearchers < ActiveRecord::Migration[6.1]
  def change
    add_column :Researchers, :organization_name, :string
  end
end
