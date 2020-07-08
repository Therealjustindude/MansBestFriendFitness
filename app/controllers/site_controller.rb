class SiteController < ApplicationController
    before_filter :authenticate_user!
    def index
        @users = Users.all
        @dogs = Dogs.all 
    end
end
