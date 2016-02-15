class Museum < ActiveRecord::Base
	has_many :exhibitions
	has_many :paintings
	
	validates :name, presence: true
	validates :city, presence: true
	
	def full_display
		return self.name+" - "+self.city
	end
end
