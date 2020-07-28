class SiteController < ApplicationController
    before_action :authenticate_user!
    def index
        if params[:query]
            @user= User.where('FIRST_NAME like ?', "%#{params[:query]}%") 
            #@user=[]
            if @user.empty?
                redirect_to root_path, alert: "User could not be found..."
            end
        else
            @user = User.all
        end
    end
end
