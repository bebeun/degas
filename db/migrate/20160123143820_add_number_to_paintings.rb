class AddNumberToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :number, :integer
  end
end
