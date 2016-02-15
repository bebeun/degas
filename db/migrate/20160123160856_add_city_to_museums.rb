class AddCityToMuseums < ActiveRecord::Migration
  def change
    add_column :museums, :city, :string
  end
end
