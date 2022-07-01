class CatsController < ApplicationController


    def cat_params
        params.require(:cat).permit(:birth_date, :name, :color, :sex, :description)

    end

    def index
        @cats = Cat.all
        render :index
        
    end

    def show
        @cat = Cat.find(params[:id])
        render :show

    end

    def create
        @cat = Cat.new(cat_params)

        if @cat.save!
            redirect_to cat_url(@cat)
        else 
            render json: @cat.errors.full_messages, status: unprocessable_entity
        end
    end

    def update
        @cat = Cat.find(cat_params[:id])
        if @cat

    end


    def new
        render :new
    end

    def edit
        render :edit
    end

    def destroy
        @cat = Cat.find(params[:id])
        @cat.destroy
        redirect_to cats_url
    end

    
end