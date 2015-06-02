class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  def index
    @friendships = Friendship.all
  end

  def show
  end

  def new
    @friendship = Friendship.new
  end

  def edit
  end

  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.save
  end

  def update
    @friendship.update(friendship_params)
  end

  def destroy
    @friendship.destroy
  end

  private
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end
end
