class AddMuseumToPaintings < ActiveRecord::Migration
  def change
    add_reference :paintings, :museum, index: true, foreign_key: true
  end
end
