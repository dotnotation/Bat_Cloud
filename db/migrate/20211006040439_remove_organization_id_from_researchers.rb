class RemoveOrganizationIdFromResearchers < ActiveRecord::Migration[6.1]
  def change
    remove_column :researchers, :organization_id
  end
end
