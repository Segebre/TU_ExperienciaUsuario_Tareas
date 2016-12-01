class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at).reverse
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Added Successfully!"
    else
      flash[:errors] = "Could not register post"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to @post, notice: "Updated Successfully!"
    else
      flash[:errors] = "Could not update post"
      render :new
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path, notice: "Successfully Destroyed!"
  end

  protected
    def post_params
      params.require(:post).permit(:message, :scheduled_at, :location, :avatar_url, :character_id)
    end
end
