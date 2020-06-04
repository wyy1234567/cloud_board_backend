class ImagesController < ApplicationController
    def index
        render json: Image.all 
    end

    def show
        image = Image.find(params[:id])
        render json: image, except: [:created_at, :updated_at]
    end

    def create 
        image = Image.create(image_params)
        render json: image, except: [:created_at, :updated_at]
    end

    def update 
        image = Image.find(params[:id])
        image.update(image_params)
        render json: image, except: [:created_at, :updated_at]
    end

    def destroy
        image = Image.find(params[:id])
        image.destroy
    end

    private
    def image_params
        params.require(:image).permit(:image_url, :post_id)
    end
end
