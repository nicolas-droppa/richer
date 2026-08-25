class Transaction < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :amount, comparison: { greater_than: 0 }

  enum kind: { expense: 0, income: 1 }
end
