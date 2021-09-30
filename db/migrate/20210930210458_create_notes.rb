class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :content
      t.belongs_to :bat_id, null: false, foreign_key: true
      t.belongs_to :researcher_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
