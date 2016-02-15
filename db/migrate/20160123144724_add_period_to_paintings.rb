class AddPeriodToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :period, :string
  end
end
