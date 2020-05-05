class SpasController < ApplicationController
    before_action :set_spa, only: [:show]
    def index
        @spas = Spa.order(:name)
    end

    def show
    end

    private

    def set_spa
        @spa = Spa.find_by(id: params[:id])
    end
end