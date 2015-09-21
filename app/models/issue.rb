class Issue < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :neighborhood
  validates :headline, presence: true
end
