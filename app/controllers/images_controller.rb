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
        render "new"
  	end
  end

  def edit
  	@image = Image.find_by_id(params[:id])
  end

  def update
  	@image = Image.find_by_id(params[:id])
  	if @image.update(img_params)
  		flash[:notice] = "Image successfully updated!"
          redirect_to action: 'index'
  	else
  		flash[:error] = "data not valid"
  		render 'edit'
  	end
  end

  def show
  	@image = Image.find_by_id(params[:id])
  end

  def destroy
  	@image = Image.find_by_id(params[:id])
  	if @image.destroy
        flash[:notice] = "Image successfully deleted"
        redirect_to action: 'index'
    else
        flash[:error] = "fails delete a records"
        redirect_to action: 'index'
    end
  end

  private
  	def img_params
      params.require(:image).permit(:title, :image)
    end
end
