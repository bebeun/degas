class ExhibitionsPainting < ActiveRecord::Base
	belongs_to :exhibition
	belongs_to :painting
end
