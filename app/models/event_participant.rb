class EventParticipant < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :ticket
  validates_uniqueness_of :user_id, scope: :event_id
end
