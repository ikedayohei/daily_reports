class Report < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :comments

  with_options presence: true do
    validates :text
    validates :reponder
    validates :date
    validates :where
  end

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

end
