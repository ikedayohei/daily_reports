class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  
  has_many :reports, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_reports, through: :bookmarks, source: :report
  has_many :comments
  has_many :likes, dependent: :destroy
  def already_liked?(company)
    self.likes.exists?(company_id: company.id)
  end
  has_many :liked_compnies, through: :likes, source: :company

  

  

end
