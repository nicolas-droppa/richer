class User < ApplicationRecord
  has_many :transactions, dependent: :delete_all

  devise :database_authenticatable, :registerable, :validatable
  validates :given_name, :family_name, presence: true
end
