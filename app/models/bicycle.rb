class Bicycle < ApplicationRecord
  belongs_to :user

  validates_presence_of :make, :model, :color, :size
end
