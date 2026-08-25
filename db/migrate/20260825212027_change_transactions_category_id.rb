class ChangeTransactionsCategoryId < ActiveRecord::Migration[7.1]
  def change
    execute <<~SQL
      INSERT INTO categories (title, color, icon, user_id, created_at, updated_at)
      SELECT 'General', 0, 0, users.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
      FROM users
      WHERE EXISTS (
        SELECT 1 FROM transactions
        WHERE transactions.user_id = users.id AND transactions.category_id IS NULL
      )
      AND NOT EXISTS (
        SELECT 1 FROM categories
        WHERE categories.user_id = users.id AND categories.title = 'General'
      )
    SQL

    execute <<~SQL
      UPDATE transactions
      SET category_id = (
        SELECT categories.id
        FROM categories
        WHERE categories.user_id = transactions.user_id
          AND categories.title = 'General'
        ORDER BY categories.id
        LIMIT 1
      )
      WHERE category_id IS NULL
    SQL

    execute <<~SQL
      UPDATE transactions
      SET category_id = (SELECT id FROM categories ORDER BY id LIMIT 1)
      WHERE category_id IS NULL
    SQL

    change_column_null :transactions, :category_id, false
  end
end
