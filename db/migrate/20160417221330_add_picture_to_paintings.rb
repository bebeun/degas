class AddPictureToPaintings < ActiveRecord::Migration
  	def change
    	add_attachment :paintings, :picture
  	end
end
