class CategoriesController < ApplicationController
    def index
        render json: Category.all, except: [:created_at, :updated_at]
    end

    def show
        category = Category.find(params[:id])
        render json: category, except: [:created_at, :updated_at]
    end

    def create 
        category = Category.create(category_params)
        render json: category, except: [:created_at, :updated_at]
    end

    def update 
        category = Category.find(params[:id])
        category.update(category_params)
        render json: category, except: [:created_at, :updated_at]
    end

    def destroy
        category = Category.find(params[:id])
        category.destroy
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end
end
