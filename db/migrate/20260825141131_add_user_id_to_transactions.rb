class AddUserIdToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :user_id, :integer
    add_foreign_key :transactions, :users
  end
end
