class AreasController < ApplicationController
    def index
        render json: Area.all 
    end

    def show
        area = Area.find(params[:id])
        render json: area, except: [:created_at, :updated_at]
    end

    def create 
        area = Area.create(area_params)
        render json: area, except: [:created_at, :updated_at]
    end

    def update 
        area = Area.find(params[:id])
        area.update(area_params)
        render json: area, except: [:created_at, :updated_at]
    end

    def destroy
        area = Area.find(params[:id])
        area.destroy
    end

    private
    def area_params
        params.require(:area).permit(:zipcode, :name)
    end
end
