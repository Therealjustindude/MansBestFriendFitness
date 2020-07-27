class SiteController < ApplicationController
    before_action :authenticate_user!
    def index
        if params[:query]
            @user= User.where('FIRST_NAME like ?', "%#{params[:query]}%")
        else
            @user = User.all
        end
    end
end
