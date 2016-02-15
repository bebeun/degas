class AddYearToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :year, :integer
  end
end
