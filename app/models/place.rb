class Place < ApplicationRecord
  belongs_to :user
  belongs_to :report 

  validates :where, presence: true

end
