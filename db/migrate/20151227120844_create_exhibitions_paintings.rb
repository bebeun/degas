class CreateExhibitionsPaintings < ActiveRecord::Migration
  def change
    create_table :exhibitions_paintings do |t|

      t.timestamps null: false
    end
  end
end
