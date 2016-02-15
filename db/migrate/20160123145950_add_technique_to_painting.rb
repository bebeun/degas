class AddTechniqueToPainting < ActiveRecord::Migration
  def change
    add_column :paintings, :technique, :string
  end
end
