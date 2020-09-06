class PostsController < ApplicationController
  before_action :set_post, only:[ :edit, :show]
  before_action :move_to_index, except: [:index, :show]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path 
    else
      redirect_to new_post_path
    end
  end

  def destroy
    post = Post.find(params[:id])
     post.destroy
      redirect_to root_path
  end

  def edit
 
  end

  def show
    
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
      redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title,:text,:genre_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
