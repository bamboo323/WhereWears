class AddStarToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :star, :float
  end
end
