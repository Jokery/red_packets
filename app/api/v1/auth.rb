module V1
  class Auth < Grape::API

    resources :auth do
      desc '登录接口'
      params do
        requires :user_id, type: String, desc: '用户名'
      end
      post '/login', rabl: 'v1/user' do
        @user = User.find_by(username: params[:username])
        error_unauthorized! if @user.nil?
        session[:user_id] = @user.id
      end
    end

  end
end
