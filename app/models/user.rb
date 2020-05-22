class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2]
  validates :name, presence: true

  has_many :sns_credentials
  has_many :reports, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_reports, through: :bookmarks, source: :report
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :sns_credentials

  def already_liked?(company)
    self.likes.exists?(company_id: company.id)
  end
  has_many :liked_compnies, through: :likes, source: :company

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
  
end
