class PostsController < ApplicationController

  def index
    @posts = Post.mysearch(params[:title], params[:category_id], params[:tags])
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end


end
