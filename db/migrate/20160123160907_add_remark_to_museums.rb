class AddRemarkToMuseums < ActiveRecord::Migration
  def change
    add_column :museums, :remark, :string
  end
end
