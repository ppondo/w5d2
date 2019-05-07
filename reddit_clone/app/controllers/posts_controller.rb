class PostsController < ApplicationController

  before_action :ensure_logged_in, :ensure_author

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to sub_url(@post.sub)
    else
    flash.now[:errors] = @post.errors.full_messages
    render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to sub_url(@post.sub)
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :edit
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub)
  end

  def post_params
    params.require(:post).permit(:sub_id, :title, :url, :content)
  end

  def ensure_author
    @post.author.id == current_user.id
  end
end
