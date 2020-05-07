class TreatmentsController < ApplicationController
    before_action :set_treatment, only: [:show, :edit, :update, :destroy]
    before_action :set_spa_from_nest, only: [:new, :destroy]

    def show
    end

    def new
        @treatment = @spa.treatments.build
    end

    def create
        @treatment = Treatment.create(treatment_params)
        if @treatment.valid?
            redirect_to spa_treatment_path(@treatment.spa, @treatment)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @treamtent.update(treatment_params)
            redirect_to spa_treatment_path(@treatment.spa, @treatment)
        else
            render:edit
        end
    end

    def destroy
        @spa = Spa.find_by(id: params[:spa_id])
        @treatment.destroy
        redirect_to spa_path(@spa)
    end

    private

    def set_treatment
        @treatment = Treatment.find_by(id: params[:id])
    end

    def treatment_params
        params.require(:treatment).permit(:name, :description, :price, :duration, :spa_id)
    end
end