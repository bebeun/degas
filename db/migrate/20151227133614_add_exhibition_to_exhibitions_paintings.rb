class AddExhibitionToExhibitionsPaintings < ActiveRecord::Migration
  def change
    add_reference :exhibitions_paintings, :exhibition, index: true, foreign_key: true
  end
end
