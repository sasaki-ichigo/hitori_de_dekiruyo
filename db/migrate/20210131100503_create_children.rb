class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.string :name,            null: false
      t.integer :tree_id,        null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end