require 'rails_helper'

RSpec.describe EventParticipant, type: :model do
  it { should belong_to(:event) }
  it { should belong_to(:user) }
  it { should belong_to(:ticket) }

  it { should validate_uniqueness_of(:user_id).scoped_to(:event_id) }
end