class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :title
      t.integer :kind, null: false, default: 0
      t.float :amount, null: false, default: 0

      t.timestamps
    end
  end
end
