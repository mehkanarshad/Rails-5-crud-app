class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update , :destroy]
  before_action :authenticate_user!, except: [:index, :show , :create , :new]
  def index
    @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
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

  # def create
  #   @post = Post.new(post_params)
  #   @post.user = current_user 
  #   if @post.save 
  #     redirect_to posts_path, notice: 'Post created succesfully.'
  #   else
  #     flash.now[:alert] = @post.errors.full_messages.to_sentence
  #     puts @post.errors.full_messages
  #     # render :new, alert: @post.errors.full_messages.to_sentence
  #     redirect_to new_post_path, alert: @post.errors.full_messages.to_sentence

  #   end
  # end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path, notice: 'Post created successfully.'
    else
      # flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body , :image , :file , :clip , thumbnail_videos: [])
  end

end
