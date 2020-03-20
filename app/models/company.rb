class Company < ApplicationRecord
  belongs_to :user
  belongs_to :report
  validates :name, presence: true

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  
end
