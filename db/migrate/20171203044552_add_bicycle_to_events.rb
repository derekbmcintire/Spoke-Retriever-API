class AddBicycleToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :bicycle, foreign_key: true
  end
end
