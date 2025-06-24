class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update , :destroy]
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post updated successfully.'
    else
      render :edit, alert: 'Error updating post.'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post deleted successfully.'
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      redirect_to posts_path, notice: 'Post created succesfully.'
    else
      render :new, alert: 'Error creating post.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body , :image , :file)
  end

end
