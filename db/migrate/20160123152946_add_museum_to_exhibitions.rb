class AddMuseumToExhibitions < ActiveRecord::Migration
  def change
    add_reference :exhibitions, :museum, index: true, foreign_key: true
  end
end
