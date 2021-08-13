class CategoriesController < ApplicationController

    before_action :authorized, only:[:create]
    before_action :find_category, only:[:destroy]

    def create
        category = @user.categories.create(categories_params)
        render json: category
    end

    def index
        categories = Category.all
        render json: categories
    end

    def destroy
        @category.destroy
        render json: @category
    end 

    private

    def find_category
        @category = Category.find(params[:id])
    end


    def categories_params
        params.permit(:name, :duration)
    end 

end
