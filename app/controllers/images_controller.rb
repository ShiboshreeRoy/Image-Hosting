class ImagesController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_user!, only: [:index,:new, :create]
  
    def index
      @images = Image.all
    end
  
    def show
      @image = Image.find(params[:id])
      @image.increment!(:views)
    end
  
    def new
      @image = Image.new
    end
  
    def create
        @image = current_user.images.build(image_params)

      if @image.save
        redirect_to @image, notice: "Image uploaded successfully!"
      else
        render :new
      end
    end
  
    private
  
    def image_params
      params.require(:image).permit(:title, :file)
    end
end  