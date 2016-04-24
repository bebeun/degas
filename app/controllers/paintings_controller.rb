class PaintingsController < ApplicationController
	def index
		@paintings = Painting.all.sort_by{|e| e.sort_date}
	end

	def search
		@paintings = [];
		@query = params[:q]

		Painting.all.each do |painting|
			@paintings << painting if painting.title.downcase.include?(params[:q].downcase) || painting.carton.downcase.include?(params[:q].downcase) || painting.description.downcase.include?(params[:q].downcase)
		end
		@paintings = @paintings.sort_by{|e| e.sort_date}
	end
	
	def new
		number = Painting.count !=0 ? Painting.all.collect{|p| p.number.to_i}.max + 1 : 1
		@painting = Painting.new(number: number)
	end
	
	def create
		@painting = Painting.new(painting_params)
		if @painting.has_accurate_date
			@painting.period = nil
		else
			@painting.circa = nil 
			@painting.year = nil
		end
		if @painting.save
			flash[:success] = "La fiche a été correctement crée!"
			redirect_to @painting
		else
			render 'new'
		end
	end
	
	def show
		@painting = Painting.find(params[:id])
	end
	
	def edit
		@painting = Painting.find(params[:id])
	end
	
	def update
		@painting = Painting.find(params[:id])
		opened_params = painting_params
		if opened_params[:has_accurate_date] == "true"
			opened_params[:period] = nil
		else
			opened_params[:circa] = nil
			opened_params[:year] = nil 
		end
		if @painting.update_attributes(opened_params)
			flash[:success] = "La fiche a été correctement mise à jour!"
			redirect_to @painting
		else
			render 'edit'
		end
	end
	
	def destroy
		@painting = Painting.find(params[:id])
		@painting.destroy
		flash[:success] = "La fiche a été détruite!"
		redirect_to paintings_path
	end

	def delete_picture
		@painting = Painting.find(params[:id_painting])
		if @painting.picture.destroy
			@painting.update_attributes(picture: nil)
		flash[:success] = "La photo a été détruite!"
		else
		end
		redirect_to edit_painting_path(@painting)
	end

private
	def painting_params
    	params.require(:painting).permit(:signature, :carton, :lemoisne, :description, :title, :picture, :localisation, :number, :technique, :cachet, :has_accurate_date, :year, :circa, :period, :museum_id, exhibition_ids: [])
	end
end
