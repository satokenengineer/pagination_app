class PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per(10)
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(post_params)
    redirect_to action: :index
    
  end 

  private

  def post_params
    params.permit(:body)
  end
end
