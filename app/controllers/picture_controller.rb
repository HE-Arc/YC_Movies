class PictureController < ApplicationController
	def index
		@pictures = Picture.all
	end
	
	def show
		@picture = Picture.find(params[:id])
	end
	
	def new
		@picture = Picture.new
	end
	
	def create
		@picture = Picture.new(picture_params)
	end
	
	def edit
		@picture = Picture.find(params[:id])
	end
end

private

def picture_params
  params.require(:picture).permit(:image)
end