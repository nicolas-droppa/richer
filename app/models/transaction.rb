class Transaction < ApplicationRecord
  validates :title, presence: true
  validates :amount, comparison: { greater_than: 0 }

  enum kind: { expense: 0, income: 1 }
end
