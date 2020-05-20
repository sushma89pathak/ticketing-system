class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  enum gender: {
    male: 'male',
    female: 'female'
  }

  has_many :event_participants
  has_many :events, through: :event_participants

  def attending_event?(event)
    events.exists?(event)
  end
end
