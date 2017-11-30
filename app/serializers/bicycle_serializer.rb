# frozen_string_literal: true

class BicycleSerializer < ActiveModel::Serializer
  attributes :id, :make, :model, :color, :serial_number, :size, :editable, :user_id

  def editable
    scope == object.user
  end
end
