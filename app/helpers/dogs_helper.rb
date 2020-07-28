module DogsHelper

    def current_users_dog
        @dog = current_user.dogs.find_by(id: params[:id])
    end

    def not_current_user_and_dog
        @user = User.find_by(id: params[:user_id])
        @dog = @user.dogs.find_by(id: params[:id])
    end
end
