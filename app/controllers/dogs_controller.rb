class DogsController < ApplicationController
    include DogsHelper
    before_action :authenticate_user!

    
    def show
        if current_user.id == params[:user_id]
            current_users_dog
        else
            not_current_user_and_dog
        end
       
        if @dog.nil?
            redirect_to root_path, alert: "That dog does not exist yet..."
        end
    end

    def new
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
        current_users_dog
    end

    def update
        current_users_dog
        @dog.update(dog_params)
        redirect_to user_path(current_user)
    end

    def destroy
        current_users_dog
        @dog.destroy
        redirect_to user_path(current_user)
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age, :gender, :weight, :fixed, :birthday)
    end

    

end
