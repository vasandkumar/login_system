class Admin::BlockingsController < AdminController

  def index
    @blockings = Blocking.all
  end

  def new
    @blocking = Blocking.new
  end

  def create
    @blocking = Blocking.new(blocking_params)
    if params[:blocking][:block_category].to_i == Blocking::CATEGORY_USER
      user = User.find(params[:id])
      if user
        user.block_user
        user.save
        @blocking.current_status = true
      end
    elsif params[:blocking][:block_category].to_i == Blocking::CATEGORY_IP_ADDRESS
      @blocking.current_status = true
    end
    if @blocking.save
      flash.now[:success] = "Blocked Successfully"
      redirect_to admin_users_path
    else
      flash.now[:error] = "Something went wrong."
      redirect_to admin_users_path
    end
  end

  def unblock
    @blocking = Blocking.find(params[:id])
    if @blocking.block_category == Blocking::CATEGORY_USER
      user = User.find(@blocking.block_param)
      if user
        user.unblock_user
        user.save
        @blocking.current_status = false
      end
    end
    if @blocking.save
      flash.now[:success] = "Unblocked Successfully"
      redirect_to admin_users_path
    else
      flash.now[:error] = "Something went wrong."
      redirect_to admin_users_path
    end
  end

  private
  def blocking_params
    params.require(:blocking).permit(:block_category,:block_type, :blocked_by, :block_param, :reason,)
  end

end
