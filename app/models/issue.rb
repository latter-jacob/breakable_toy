class Issue < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  belongs_to :user
  validates :headline, presence: true

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode, if: :address_changed?
  after_validation :reverse_geocode, if: :address_changed?
end
