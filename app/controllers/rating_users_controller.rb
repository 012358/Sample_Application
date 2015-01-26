class RatingUsersController < ApplicationController
  before_action :set_rating_user, only: [:show, :edit, :update, :destroy]

  def index
    @rating_users = RatingUser.all
    respond_with(@rating_users)
  end

  def show
    respond_with(@rating_user)
  end

  def new
    @rating_user = RatingUser.new
    respond_with(@rating_user)
  end

  def edit
  end

  def create
    @rating_user = RatingUser.new(rating_user_params)
    @rating_user.save
    respond_with(@rating_user)
  end

  def update
    @rating_user.update(rating_user_params)
    respond_with(@rating_user)
  end

  def destroy
    @rating_user.destroy
    respond_with(@rating_user)
  end

  private
    def set_rating_user
      @rating_user = RatingUser.find(params[:id])
    end

    def rating_user_params
      params.require(:rating_user).permit(:name)
    end
end
