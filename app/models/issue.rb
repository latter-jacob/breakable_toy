class Issue < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  belongs_to :user
  validates :headline, presence: true

  NEIGHBORHOODS = [
'¯\\_(ツ)_/¯',
'Allston',
'Brighton',
'Back Bay',
'Beacon Hill',
'Bay Village',
'Charlestown',
'Chinatown',
'Dorchester',
'Mattapan',
'East Boston',
'Fenway',
'Hyde Park',
'Jamaica Plain',
'Mission Hill',
'North End',
'Roxbury',
'South Boston',
'South End',
'West Roxbury',
'Roslindale']
 validates :neighborhood, inclusion: { in: NEIGHBORHOODS, allow_blank: true }
end
