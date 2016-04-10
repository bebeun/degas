class AddHasAccurateDateToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :has_accurate_date, :boolean
  end
end
