class ScientistsController < ApplicationController
    def index
        @scientists = Scientist.all.sort_by{|s| s.name}
    end

    def show
        set_method
    end

    def new
        @scientist = Scientist.new
    end

    def create
        @scientist = Scientist.new(params_method)
        if @scientist.save
            redirect_to scientist_path(@scientist)
        else
            flash[:user_error] = @scientist.errors.full_messages
            redirect_to new_scientist_path
        end
    end

    def edit
        set_method 
    end

    def update 
        set_method
        if @scientist.update(params_method)
            redirect_to scientist_path(@scientist)
        else
            flash[:user_error] = @scientist.errors.full_messages  
            redirect_to edit_scientist_path 
        end 
    end

    def destroy
        Scientist.find(params[:id]).destroy
        redirect_to scientists_path
    end


    private 
    def set_method
        @scientist = Scientist.find(params[:id])
    end

    def params_method
        params.require(:scientist).permit(:name, :field_of_study)
    end
end
