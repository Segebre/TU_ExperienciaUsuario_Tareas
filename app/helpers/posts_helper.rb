module PostsHelper
  def total_comments(post)
    post.comments.count
  end
end
