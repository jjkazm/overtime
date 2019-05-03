class PostsController < ApplicationController
  before_action :set_post, only:[:show, :edit, :update]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post has been succesfully created"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post has been succesfully updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private
    def post_params
      params.require(:post).permit(:date, :rationale)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
