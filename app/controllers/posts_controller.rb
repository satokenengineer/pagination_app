class PostsController < ApplicationController
  def index
    @post = Post.new 
    @posts = Post.all.page(params[:page]).order(created_at: :desc).per(10)
  end

  def create
     @post = Post.create!(post_params)
    redirect_to action: :index
  end 

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
