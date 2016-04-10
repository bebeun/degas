class AddNameToMuseums < ActiveRecord::Migration
  def change
    add_column :museums, :name, :string
  end
end
