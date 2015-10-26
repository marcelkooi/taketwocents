class PicturesController < ApplicationController

def new 
	@picture = Picture.new
end

def create
	@picture = Picture.new(picture_params)
end

def index
	@pictures = Picture.all
end

def picture_params
	params.require(:picture).permit(:link)
end

end