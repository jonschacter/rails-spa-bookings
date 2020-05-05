class SpasController < ApplicationController
    before_action :set_spa, only: [:show, :edit, :update, :destroy]
    def index
        @spas = Spa.order(:name)
    end

    def show
    end

    def new
        @spa = Spa.new
    end

    def create
        @spa = Spa.create(spa_params)
        if @spa.valid?
            redirect_to spa_path(@spa)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @spa.update(spa_params)
            redirect_to spa_path(@spa)
        else
            render :edit
        end
    end

    def destroy
        @spa.destroy
        redirect_to spas_path
    end

    private

    def set_spa
        @spa = Spa.find_by(id: params[:id])
    end

    def spa_params
        params.require(:spa).permit(:name, :address1, :address2, :city, :state, :zip, :phone_number)
    end
end