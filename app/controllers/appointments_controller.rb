class AppointmentsController < ApplicationController

    def index
        if params[:user_id] && params[:user_id] == current_user.id.to_s
            @appointments = current_user.appointments
        else
            redirect_to root_path
        end
    end

end