class AdminController < ApplicationController
  before_action :verify_admin
  def index
    @user = User.all
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_index_path, notice: "User account deleted successfully."
  end
  private
  def verify_admin
    unless current_user.has_role? :admin
      redirect_to root_path, alert: 'Only admin can access this.'
    end
  end
end
