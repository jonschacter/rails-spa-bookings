class AppointmentsController < ApplicationController

    def index
        if params[:user_id] && params[:user_id].to_i == current_user.id
            @appointments = current_user.appointments
        else
            redirect_to root_path
        end
    end

    def show
        if params[:user_id] && params[:user_id].to_i == current_user.id
            @appointment = current_user.appointments.find_by(id: params[:id])
            if @appointment.nil?
                redirect_to user_appointments_path(current_user)
            end
        else
            redirect_to root_path
        end
    end

    def new
        @appointment = current_user.appointments.build
        if params[:spa_id]
            @spa = Spa.find_by(id: params[:spa_id])
            @treatments = @spa.treatments
        end
    end

    def create
        @appointment = Appointment.create(appointment_params)
        if @appointment.valid?
            redirect_to user_appointment_path(current_user, @appointment)
        else
            render :new
        end
    end

    def edit
        set_appointment
        if @appointment.user_id != current_user.id
            redirect_to user_appointment_path(current_user)
        else
            @spa = Spa.find_by(id: params[:spa_id])
            @treatments = @spa.treatments if @spa
        end
    end

    def update
        set_appointment
        if @appointment.update(appointment_params)
            redirect_to user_appointment_path(current_user, @appointment)
        else
            render :edit
        end
    end

    def destroy
        set_appointment
        @appointment.destroy
        redirect_to user_appointments_path(current_user)
    end

    private

    def appointment_params
        params.require(:appointment).permit(:user_id, :treatment_id, :technician_id, :appointment_time)
    end

    def set_appointment
        @appointment = Appointment.find_by(id: params[:id])
    end
end