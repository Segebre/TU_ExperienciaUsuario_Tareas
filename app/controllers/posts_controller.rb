class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at).reverse
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    if(current_user)
      @post = Post.new
    else
      redirect_to login_path
    end
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
    unless(belongsToMe)
      redirect_to @post, notice:"That's not your post!!"
    end
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
    post= Post.find(params[:id])
    if(belongsToMe)
      post.destroy
      redirect_to posts_path, notice: "Successfully Destroyed!"
    else
      redirect_to post
  end

  protected
    def post_params
      params.require(:post).permit(:message, :scheduled_at, :location, :avatar_url, :character_id)
    end

    def belongsToMe
      if(current_user && current_user.id==@post.character_id || current_user && current_user.email=="system@heroe.com")
        true
      else
        false
      end
    end
end
