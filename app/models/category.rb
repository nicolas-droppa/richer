class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :delete_all

  enum color: {
    primary: 0,
    success: 1,
    danger: 2,
    warning: 4,
    info: 5
  }

  enum icon: {
    backpack: 0,
    bag: 1,
    bank: 2,
    basket: 3,
    book: 4,
    cup: 5,
    gift: 6,
    house: 7
  }
end
