class MuseumsController < ApplicationController

def index
		@museums = Museum.all
	end
	
	def new
		@museum = Museum.new()
	end
	
	def create
		@museum = Museum.new(museum_params)
		if @museum.save
			flash[:success] = "Le musée a été correctement créé !"
			redirect_to @museum
		else
			render 'new'
		end
	end
	
	def show
		@museum = Museum.find(params[:id])
	end
	
	def edit
		@museum = Museum.find(params[:id])
	end
	
	def update
		@museum = Museum.find(params[:id])
		if @museum.update_attributes(museum_params)
			flash[:success] = "Le musée a été correctement mis à jour "
			redirect_to @museum
		else
			render 'edit'
		end
	end
	
	def destroy
		@museum = Museum.find(params[:id])
		if !@museum.exhibitions.any? && !@museum.paintings.any?
			@museum.destroy
			flash[:success] = "La musée a été détruit!"
			redirect_to museums_path and return
		else
			flash[:warning] = "Ce musée est enregistré comme hébergeant des oeuvres ou ayant des expositions référencées. Vous ne pouvez pas le détruire!"
			redirect_to @museum and return
		end
	end
	
private
	def museum_params
    	params.require(:museum).permit(:name, :city, :remark)
	end
end
