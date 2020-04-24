class Company < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :companies
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  with_options presence: true do
    validates :name
    validates :postcode
    validates :phone_number
    validates :capital
    validates :sale
    validates :description

  def self.search(input)
    return nil if input == ""
    Company.where(['name LIKE(?) or postcode LIKE(?) or description LIKE(?) or characteristic LIKE(?)', "%#{input}%","%#{input}%" ,"%#{input}%" ,"%#{input}%"] ).limit(5)
  end

end
