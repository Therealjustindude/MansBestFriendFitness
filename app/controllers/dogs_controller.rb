class DogsController < ApplicationController
    before_action :authenticate_user!

    def show
        if params[:user_id]
            @user = Artist.find_by(id: params[:user_id])
            @dog = @user.dogs.find_by(id: params[:id])
            if @user.nil?
              redirect_to user_dogs_path(@user), alert: "Dog not found"
            end
        else
            @dog = Dog.find(params[:id])
        end
    end

    # def new
    #     @dog= Dog.new
    # end

    # def create
    #     dog = Dog.create(dog_params)
    #     redirect_to dog
    # end

    # def edit

    # end

    # def update

    # end

    # def destroy

    # end

    private

    def dog_parmas
        params.require(:dog).permit!
    end

end
