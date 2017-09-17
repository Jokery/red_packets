module Helpers
  module SessionHelper

    def current_user
      @current_user ||=
        if session[:user_id]
          User.find(session[:user_id])
        end

      error_unauthorized! if @current_user.nil?
      @current_user
    end

  end
end
