class AdminController < ApplicationController
  before_filter :check_admin

  def check_admin
    if !is_admin?
      redirect_to root_path
    end
  end

end