class AddRemarkToExhibitions < ActiveRecord::Migration
  def change
    add_column :exhibitions, :remark, :string
  end
end
