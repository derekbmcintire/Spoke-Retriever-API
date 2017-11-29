class BicycleSerializer < ActiveModel::Serializer
  attributes :id, :make, :model, :color, :serial_number, :size
end
