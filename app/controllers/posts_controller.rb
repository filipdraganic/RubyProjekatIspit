class PostsController < ApplicationController

  def index
    @posts = Post.paginate(page: params[:page], per_page: 2)
  end

  def new
    @post = Post.new
  end

  def create
    # @post = Post.new(post_params)
    #@user = User.find(params[:user_id])
    #@post = current_user.posts.new(params[:post])
    #@post = current_user.posts.find(post_params[:id])
    @user = User.find(current_user.id)
    @post = @user.posts.create(post_params.permit(:title, :content))
    if @post.save
      redirect_to @post
    else
      render 'new'
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
