class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash.now[:success] = "Account activated!"
      redirect_to user
    else
      flash.now[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && !user.activated?
      user.resend_activation_mail
      flash.now[:success] = "Activation mail sent to your mail id. Please activate your account."
      redirect_to root_url
    elsif user && user.activated?
      flash.now[:danger] = "Account already activated!"
      redirect_to root_url
    else
      flash.now[:danger] = "Account has some issues."
      redirect_to root_url
    end
  end

  def new

  end
end
