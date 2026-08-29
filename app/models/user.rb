class User < ApplicationRecord
  has_many :transactions, dependent: :delete_all
  has_many :categories, dependent: :destroy

  devise :database_authenticatable, :registerable, :validatable
  validates :given_name, :family_name, presence: true

  def full_name
    "#{given_name} #{family_name}"
  end
end
