class AddPaintingToExhibitionsPaintings < ActiveRecord::Migration
  def change
    add_reference :exhibitions_paintings, :painting, index: true, foreign_key: true
  end
end
