class AddCircaToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :circa, :boolean
  end
end
