class AddCartonToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :carton, :text
  end
end
