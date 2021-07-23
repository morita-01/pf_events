class EventComment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  
  validates :eventcomment, presence: true
end
