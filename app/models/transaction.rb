class Transaction < ApplicationRecord
  enum kind: { expense: 0, income: 1 }
end
