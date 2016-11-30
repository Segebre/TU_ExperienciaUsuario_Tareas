class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    # raise @comment.to_yaml

    if @comment.save
      redirect_to @post, notice: "Comment Succeded!"
    else
      flash[:error] = "Could not complete comment"
      render :new
    end
  end

   def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.update_attributes(comment_params)
      redirect_to @post, notice: "Updated Successfully!"
    else
      flash[:errors] = "Could not update loan"
      render :edit
    end
  end

  def destroy
    Post.find(params[:post_id]).comments.find(params[:id]).destroy
    redirect_to Post.find(params[:post_id]), notice: "Successfully Destroyed!"
  end

  protected
    def comment_params
      params.require(:comment).permit(:message, :character_id)
    end
end
