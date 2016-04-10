class Exhibition < ActiveRecord::Base
	has_and_belongs_to_many :paintings
	validates :year, presence: true
	
	belongs_to :museum, :class_name => 'Museum'
	validates :museum, presence: true
	
	def full_display
		return self.year.to_s+" - "+self.museum.full_display
	end
end
