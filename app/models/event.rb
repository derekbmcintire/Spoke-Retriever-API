class Event < ApplicationRecord
  belongs_to :user
  belongs_to :bicycle
  validates_presence_of :event_type, :location, :bicycle_id
end
