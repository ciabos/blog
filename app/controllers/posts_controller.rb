class PostsController < ApplicationController

  def index
    
    @posts = Post.all.paginate(:page => params[:page], :per_page => 4)

    if params[:title].present? 
      @posts = Post.search(params[:title]) 

      if params[:category_id].present?
        @posts = Post.mysearch(params[:title], {category_id: params[:category_id]} )
        if params[:tags].present? && params[:tags].any?
          @posts = Post.mysearch(params[:title], {category_id: params[:category_id], tags: params[:tags]} )
        end

      elsif params[:tags].present? && params[:tags].any?
        @posts = Post.mysearch(params[:title], {tags: params[:tags]} )
      end

    elsif params[:category_id].present?

      @posts = @posts.where(:category_id => params[:category_id])
      if params[:tags].present? && params[:tags].any?
        @posts = @posts.tagged_with(params[:tags])
      end

    elsif params[:tags].present? && params[:tags].any?
      @posts = @posts.tagged_with(params[:tags])
    end

    @posts = @posts.paginate(:page => params[:page], :per_page => 4)
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
