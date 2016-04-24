class AddLemoisneToPainting < ActiveRecord::Migration
  def change
    add_column :paintings, :lemoisne, :integer
  end
end
