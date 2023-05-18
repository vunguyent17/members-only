class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(allowed_post_params)
    @post.user_id = current_user.id
    puts @post.user_id
    if @post.save
      flash[:success] = 'Great! Your post has been created!'
      redirect_to :root
    else
      flash.now[:error] = 'Error'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def allowed_post_params
    params.require(:post).permit(:title, :body)
  end
end
