class AddNumberToExhibitions < ActiveRecord::Migration
  def change
    add_column :exhibitions, :number, :integer
  end
end
