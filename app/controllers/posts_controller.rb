class PostsController < ApplicationController

  # Return all posts
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    Post.new(post_params).save!

    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:creator, :body)
  end
end
