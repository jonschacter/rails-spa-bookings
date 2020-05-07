class TechniciansController < ApplicationController
    before_action :set_technician, only: [:show]
    
    def show
    end

    def new
        @spa = Spa.find_by(id: params[:spa_id])
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

    private

    def set_technician
        @technician = Technician.find(params[:id])
    end

    def technician_params
        params.require(:technician).permit(:spa_id, :name)
    end
end