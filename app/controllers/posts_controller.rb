class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

  # Return all posts
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    current_user.posts.create(post_params)

    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    Post.find(params[:id]).update_attributes!(post_params)

    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
