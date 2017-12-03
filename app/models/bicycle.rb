class Bicycle < ApplicationRecord
  belongs_to :user
  has_many :events
  validates_presence_of :make, :model, :color, :size, :url
end
