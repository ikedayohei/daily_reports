class Report < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :text
    validates :where
    validates :reponder
    validates :companion
    validates :date
  end

end
