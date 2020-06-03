class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :report

  validates :user_id, uniqueness: { scope: :report_id }

  scope :bookmark_user, -> { order("created_at DESC")} 

end
