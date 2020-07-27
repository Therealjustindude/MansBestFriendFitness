class DogsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!

    def show
        if current_user.id != params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @dog = @user.dogs.find_by(id: params[:id])
            
        else
            @dog = current_user.dogs.find_by(id: params[:id])
        end
        
        #if dog id not in db
        if @dog.nil? 
            
            redirect_to root_path, alert: "Dog not found"
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
        @dog = current_user.dogs.find_by(id: params[:id])
    end

    def update
        dog = current_user.dogs.find_by(id: params[:id])
        dog.update(dog_params)
        redirect_to user_path(current_user)
    end

    def destroy
        dog = current_user.dogs.find_by(id: params[:id])
        dog.destroy
        redirect_to user_path(current_user)
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age, :gender, :weight, :intact, :birthday)#journal_entry_attributes[:title, :entry,:date], diet_entry_attributes[:food, :snacks, :water, :calories], exercise_entry_attributes[:name, :duration, :description])
    end

end
