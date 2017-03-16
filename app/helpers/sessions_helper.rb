module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def authenticate_user!
    redirect_to log_in_path if !user_signed_in?
  end

  def authorize_only_current_user_or_admin_priviledge!
    redirect_to(users_path, notice: "You don't have access to do that") if params[:id].to_i != current_user.id and !current_user.role.admin?
  end

  def authorize_only_admin!
    redirect_to(users_path, notice: "You don't have access to do that") if !current_user.role.admin?
  end

  def check_approve!
    redirect_to( current_user, notice: "you still need an approvement on your account") if !current_user.approve?
  end

end
