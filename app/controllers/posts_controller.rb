class PostsController < ApplicationController
  def index
    @posts = Post.all

    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @categories =  []

    authorize @post
  end

  def create
    @post = Post.new(params.require(:post).permit(:product, :description))
    @user = current_user
    authorize @post

    #raise # This will short-circuit the method

    if @post.save
      flash[:notice] = "Post saved successfully!"
      redirect_to @post
    else
      flash[:error] = " There was an error saving the post. Please try again!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(params.require(:post).permit(:product, :description))
      flash[:notice] = "Post was updated"
      redirect_to @post
    else
      flash[:error] = "There was an error updating your post! Please try again!"
      render :edit
    end
  end

  # def post_params
  #   params.require(:post).permit(:product, :description, :user_id)
  # end
end
