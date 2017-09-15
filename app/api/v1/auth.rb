module V1
  class Auth < Grape::API

    resources :auth do
      post '/login', rabl: 'v1/user' do
        @user = User.find_by(username: params[:username])
        error_unauthorized! if @user.nil?
        session[:user_id] = @user.id
      end
    end

  end
end
