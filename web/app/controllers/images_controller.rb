class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
  	@image = Image.new
  end

  def create
  	@image = Image.new(image_params)

    if @image.save
      redirect_to images_path
    else
      redirect_to root_path
    end
  end

  private
  	def image_params
  		params.require(:image).permit(:link)
  	end

end