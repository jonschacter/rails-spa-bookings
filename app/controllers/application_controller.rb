class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        request.env['omniauth.origin'] || root_path
    end

    def set_spa_from_nest
        @spa = Spa.find_by(id: params[:spa_id])
    end

    def params_user_id_match?
        if params[:user_id].to_i == current_user.id
            true
        else
            redirect_to root_path
        end
    end
end
