class AddUrlToBicycles < ActiveRecord::Migration[5.1]
  def change
    add_column :bicycles, :url, :string
  end
end
