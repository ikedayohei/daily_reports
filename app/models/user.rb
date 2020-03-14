class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reports, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_reports, through: :bookmarks, source: :report
  has_many :comments
  validates :name, presence: true

  

end
