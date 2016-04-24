class Painting < ActiveRecord::Base
	validates :title, presence: true
	validates :number, presence: true, uniqueness: true

	validates :lemoisne, uniqueness: true

	has_attached_file :picture
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
	before_destroy { |painting| painting.picture.destroy }
	
	validates :technique, presence: true
	validates_inclusion_of :technique, :in => ["Huile sur toile", "Huile sur papier", "Huile sur panneau", "Huile sur carton", "Huile sur autre", "Pastel sur papier", "Pastel sur autre", "Mixte sur toile", "Mixte sur papier", "Mixte sur autre", "Pastel et fusain"]
	
	validates :cachet, presence: true
	validates_inclusion_of :cachet, :in => ["Vente Degas", "Atelier", "Invisible", "Pas de cachet"]
	
	validates :localisation, presence: true
	validates_inclusion_of :localisation, :in => ["Musée", "Collection Particulière", "Inconnu"]

	validates :signature, presence: true
	validates_inclusion_of :signature, :in => ["Signé", "Non signé", "Invisible"]

	has_and_belongs_to_many :exhibitions
	accepts_nested_attributes_for :exhibitions
	
	validates_inclusion_of :has_accurate_date, :in => [true, false]
	
	validates :year, presence: true, if: :has_accurate_date
	validates_inclusion_of :circa, :in => [true, false], if: :has_accurate_date
	
	validates :period, presence: true, if: :not_has_accurate_date
	validates_inclusion_of :period, :in => ["1850-1860","1860-1870","1870-1880","1880-1890","1890-1900","1900-1910"], if: :not_has_accurate_date
	
	belongs_to :museum, :class_name => 'Museum'
	validates :museum, presence: true, if: :should_have_museum
	
	def not_has_accurate_date
		return !self.has_accurate_date if !has_accurate_date.nil?
		return false if has_accurate_date.nil?
	end
	
	def should_have_museum
		return self.localisation == "Musée"
	end

	def sort_date
		return (has_accurate_date) ? year : period.split("-")[0].to_i
	end

end
