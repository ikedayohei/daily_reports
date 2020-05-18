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
  
  scope :report_new, -> { order("created_at DESC")} 
  scope :ranking, -> { order("count_all DESC")}

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

end
