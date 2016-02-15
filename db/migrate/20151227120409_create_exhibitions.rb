class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.integer :year

      t.timestamps null: false
    end
  end
end
