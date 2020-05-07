class TechniciansController < ApplicationController
    before_action :set_technician, only: [:show, :edit, :update, :destroy]
    
    def show
    end

    def new
        @technician = Technician.new
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
    end

    def update
        if @technician.update(technician_params)
            redirect_to spa_technician_path(@technician.spa, @technician)
        else
            render :edit
        end
    end

    def destroy
        @spa = Spa.find_by(id: params[:spa_id])
        @technician.destroy
        redirect_to spa_path(@spa)
    end

    private

    def set_technician
        @technician = Technician.find(params[:id])
    end

    def technician_params
        params.require(:technician).permit(:spa_id, :name)
    end
end