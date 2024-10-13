class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]  # Agrega el before_action aquí

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def edit
    authorize! :edit, @post
  end

  def update
    authorize! :update, @post
    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    authorize! :destroy, @post
    @post.destroy
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def show
    # @post se establece automáticamente por el before_action
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])  # Usa find_by para evitar errores si no se encuentra
    if @post.nil?
      flash[:alert] = "Post no encontrado."
      redirect_to posts_path  # Redirige a la lista de posts si no se encuentra
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :published)  # Asegúrate de tener los parámetros permitidos
  end
end
