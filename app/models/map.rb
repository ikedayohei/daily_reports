class Map < ApplicationRecord
  belongs to company
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
