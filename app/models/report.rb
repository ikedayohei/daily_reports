class Report < ApplicationRecord
  belongs_to :user
  has_many :places
  has_many :bookmarks
  has_many :comments

  with_options presence: true do
    validates :text
    validates :where
    validates :reponder
    validates :date
  end

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

end
