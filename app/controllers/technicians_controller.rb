class TechniciansController < ApplicationController
    before_action :set_technician, only: [:show, :update]
    before_action :set_spa, only: [:new, :edit, :update]
    
    def show
    end

    def new
        @technician = @spa.technicians.build
    end

    def create
        @technician = Technician.create(technician_params)
        if @technician.valid?
            redirect_to spa_technician_path(@technician.spa, @technician)
        else
            render :new
        end
    end

    def edit
        @technician = @spa.technicians.find_by(id: params[:id])
    end

    def update
        if @technician.update(technician_params)
            redirect_to spa_technician_path(@technician.spa, @technician)
        else
            render :edit
        end
    end

    private

    def set_technician
        @technician = Technician.find(params[:id])
    end

    def set_spa
        @spa = Spa.find_by(id: params[:spa_id])
    end

    def technician_params
        params.require(:technician).permit(:spa_id, :name)
    end
end