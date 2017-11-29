class BicycleSerializer < ActiveModel::Serializer
  attributes :id, :make, :model, :color, :serial_number, :size

  # def editable
  #   scope == object.user
  # end
end
