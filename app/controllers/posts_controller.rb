class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at)
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
  end

  protected
    def post_params
      params.require(:post).permit(:message, :scheduled_at, :location, :avatar_url)
    end
end
