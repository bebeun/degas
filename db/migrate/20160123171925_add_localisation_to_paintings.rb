class AddLocalisationToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :localisation, :string
  end
end
