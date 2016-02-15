class AddCachetToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :cachet, :string
  end
end
