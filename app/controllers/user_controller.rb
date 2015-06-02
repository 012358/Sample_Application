class UserController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def edit

  end

  def show

  end

  def update
    @user.update(user_params)
    redirect_to calendars_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :phone, :address, :country, :job_title)
    end
end
