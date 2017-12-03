class Event < ApplicationRecord
  belongs_to :user
  validates_presence_of :event_type, :location
end
