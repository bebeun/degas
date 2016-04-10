class ExhibitionsController < ApplicationController
	def index
		@exhibitions = Exhibition.all
	end
	
	def new
		@exhibition = Exhibition.new()
	end
	
	def create
		@exhibition = Exhibition.new(exhibition_params)
		if @exhibition.save
			flash[:success] = "L'exposition a été correctement !"
			redirect_to @exhibition
		else
			render 'new'
		end
	end
	
	def show
		@exhibition = Exhibition.find(params[:id])
	end
	
	def edit
		@exhibition = Exhibition.find(params[:id])
	end
	
	def update
		@exhibition = Exhibition.find(params[:id])
		if @exhibition.update_attributes(exhibition_params)
			flash[:success] = "L'exposition a été correctement mise à jour!"
			redirect_to @exhibition
		else
			render 'edit'
		end
	end
	
	def destroy
		@exhibition = Exhibition.find(params[:id])
		@exhibition.destroy
		flash[:success] = "L'exposition a été détruite!"
		redirect_to exhibitions_path
	end
	
private
	def exhibition_params
    	params.require(:exhibition).permit(:year, :number, :remark, :museum_id)
	end
end

