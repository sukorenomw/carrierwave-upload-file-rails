class ImagesController < ApplicationController
  def index
  	@images = Image.all
  end

  def new
  	@image = Image.new
  end

  def create
  	@image = Image.new(img_params)
  	if @image.save
  		flash[:notice] = "Image successfully uploaded!"
  		redirect_to action: "index"
  	else
  		flash[:error] = "data not valid"
        render 'new'
  	end
  end

  def edit
  end

  def show
  	@image = Image.find_by_id(params[:id])
  end

  private
  	def img_params
      params.require(:image).permit(:title, :image)
    end
end
