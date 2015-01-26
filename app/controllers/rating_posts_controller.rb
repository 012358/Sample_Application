class RatingPostsController < ApplicationController
  before_action :set_rating_post, only: [:show, :edit, :update, :destroy]

  def index
    @rating_posts = RatingPost.all

  end

  def show

  end

  def new
    @rating_post = RatingPost.new

  end

  def edit
  end

  def create
    @rating_post = RatingPost.new(rating_post_params)
    @rating_post.save
    redirect_to rating_posts_path
  end

  def update
    @rating_post.update(rating_post_params)

  end

  def destroy
    @rating_post.destroy

  end

  private
    def set_rating_post
      @rating_post = RatingPost.find(params[:id])
    end

    def rating_post_params
      params.require(:rating_post).permit(:title)
    end
end
