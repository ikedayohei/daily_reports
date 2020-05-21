class Like < ApplicationRecord
  belongs_to :user
  belongs_to :company, counter_cache: :likes_count
  validates_uniqueness_of :company_id, scope: :user_id
  
  scope :ranking, -> { order("count_all DESC") }

end
