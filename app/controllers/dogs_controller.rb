class DogsController < ApplicationController
    before_filter :authenticate_user!
    def index
        @dogs = Dog.all
    end

    def show
        @dog = Dog.find_by(id: params[:id])
    end

    def new
        @dog= Dog.new
    end

    def create
        dog = Dog.create(dog_params)
        redirect_to dog
    end

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
