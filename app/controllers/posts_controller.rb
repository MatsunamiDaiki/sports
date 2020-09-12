class PostsController < ApplicationController
  before_action :set_post, only:[ :edit, :show]
  before_action :move_to_index, except: :index
  def index
    @posts = Post.includes(:user).order("created_at DESC")
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
      redirect_to root_path
  end

  def search
    @posts = Post.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:text,:genre_id).merge(user_id: current_user.id)
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
