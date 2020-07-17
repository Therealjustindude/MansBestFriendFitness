class DogsController < ApplicationController
    before_action :authenticate_user!

    def show
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @dog = @user.dogs.find_by(id: params[:id])
            if @user.nil?
              redirect_to user_dogs_path(@user), alert: "Dog not found"
            end
        else
            @dog = Dog.find(params[:id])
        end
    end

    def new
        @user = current_user
        @dog = Dog.new
    end

    def create
        @dog = current_user.dogs.build(dog_params)
            if @dog.save
                redirect_to user_path(current_user)
            else
                render :new
            end 
    end

    def edit
        @user = current_user
        @dog = current_user.dogs.find_by(id: params[:id])
    end

    def update
        dog = current_user.dogs.where(id: params[:id])
        dog.update(dog_params)
        redirect_to user_path(current_user)
    end

    def destroy
        dog = current_user.dogs.where(id: params[:id])
        dog.destroy
        redirect_to user_path(current_user)
    end

    private

    def dog_params
        params.require(:dog).permit!
    end

end
