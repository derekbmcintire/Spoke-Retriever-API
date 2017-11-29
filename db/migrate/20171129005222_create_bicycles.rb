class CreateBicycles < ActiveRecord::Migration[5.1]
  def change
    create_table :bicycles do |t|
      t.string :make
      t.string :model
      t.string :color
      t.string :serial_number
      t.string :size

      t.timestamps
    end
  end
end
