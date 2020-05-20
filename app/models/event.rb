class Event < ActiveRecord::Base

  has_many :event_participants
  has_many :users, through: :event_participants
  has_many :tickets

  default_scope { order(created_at: :asc) }

  def past?
    Date.today > end_date
  end

end
