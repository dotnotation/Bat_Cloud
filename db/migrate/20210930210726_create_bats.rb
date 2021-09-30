class CreateBats < ActiveRecord::Migration[6.1]
  def change
    create_table :bats do |t|
      t.string :tag_number
      t.string :nickname
      t.string :species
      t.datetime :date_found
      t.string :location
      t.datetime :date_last_seen
      t.integer :weight
      t.integer :age
      t.string :sex
      t.integer :wing_span
      t.integer :colony_size
      t.string :conservation_status
      t.boolean :white_nose_syndrome
      t.integer :discoverer_id

      t.timestamps
    end
  end
end
