class SpasController < ApplicationController
    def index
        @spas = Spa.order(:name)
    end
end