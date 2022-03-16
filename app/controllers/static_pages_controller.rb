class StaticPagesController < ApplicationController

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def home
        if current_user.nil?
            redirect_to '/login'
        end
    end

    def help
        if current_user.nil?
            redirect_to '/login'
        end
    end

    def about
        if current_user.nil?
            redirect_to '/login'
        end
    end

    def contact
        if current_user.nil?
            redirect_to '/login'
        end
    end

end
