class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to @current_user
    end
  end

  def create
    user = User.find_by(:username => params[:session][:username])
    require 'geoip'
    info = GeoIP.new(Rails.root.join("GeoLiteCity.dat")).city(request.remote_ip)
    if user
      if info
        attempt = LoginAttempt.create(:user_id => user.id, :ip_address => request.remote_ip, :country_name => info.country_name, :city_name => info.city_name, :real_region_name => info.real_region_name, :success => false)
      else
        attempt = LoginAttempt.create(:user_id => user.id, :ip_address => request.remote_ip, :country_name => LoginAttempt::UNKNOWN_VALUE, :city_name => LoginAttempt::UNKNOWN_VALUE, :real_region_name => LoginAttempt::UNKNOWN_VALUE, :success => false)
      end
    end
    if user && user.authenticate(params[:session][:password])
      log_in user
      attempt.update_attributes( :success => true )
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
