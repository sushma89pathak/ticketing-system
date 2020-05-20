class Ticket < ActiveRecord::Base
  belongs_to :event
  
  FEMALE_DISCOUNT = 0.05

end
