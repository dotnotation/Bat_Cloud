class CreateResearchers < ActiveRecord::Migration[6.1]
  def change
    create_table :researchers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :phone_number
      t.integer :organization_id, foreign_key: true
      t.string :uid
      t.string :provider
      t.string :access, default: "member"

      t.timestamps
    end
  end
end
