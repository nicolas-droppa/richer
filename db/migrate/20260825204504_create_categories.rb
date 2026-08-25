class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :color
      t.integer :icon
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
