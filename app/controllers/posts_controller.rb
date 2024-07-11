class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def update
    if @post
      if params[:post][:title].present? && params[:post][:body].present?
        if @post.update(post_params)
          redirect_to @post, notice: 'Post was successfully updated.'
        else


          
          render :edit
        end
      else
        flash.now[:alert] = 'Title and body must be present.'
        render :edit
      end
    else
      redirect_to posts_url, alert: 'Post not found.'
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
