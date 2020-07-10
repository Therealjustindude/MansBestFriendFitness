class SiteController < ApplicationController
    before_action :authenticate_user!
    def index
        # @users = Users.all
        # @dogs = Dogs.all 
    end
end
