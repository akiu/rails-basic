class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    private

    #if @current_user is nil, do find
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    # agar method current_user avaible di view, helper_method ??
    helper_method :current_user   

    def authorize
        redirect_to new_session_path, alert: "Please Login First" if current_user.nil?
    end
end
