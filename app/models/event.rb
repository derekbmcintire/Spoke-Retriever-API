class Event < ApplicationRecord
  has_many :bicycles
  belongs_to :user
  validates_presence_of :type, :location
end
