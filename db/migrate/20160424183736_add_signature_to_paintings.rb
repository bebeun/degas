class AddSignatureToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :signature, :string
  end
end
