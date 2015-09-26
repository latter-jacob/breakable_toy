require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe Issue do
    it { should validate_presence_of(:headline) }

  end
end
