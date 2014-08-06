class PostsController < ApplicationController

  def index
    if params[:title] || params[:category_id] || params[:tags]
      title = params[:title].present? ? params[:title] : '*'
      @posts = Post.mysearch(title, params[:category_id], params[:tags], params[:page] || 1, 4)
    else
      @posts = Post.paginate(page: params[:page] || 1, per_page: 4)
    end
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
