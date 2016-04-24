class AddUnitToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :unit, :string
  end
end
