class AddWidthToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :width, :float
  end
end
