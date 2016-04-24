class AddHeigthToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :heigth, :float
  end
end
