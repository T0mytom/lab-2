class CommentsController < ApplicationController
  # Asegúrate de que los usuarios estén autenticados para las acciones relevantes
  before_action :authenticate_user!, only: [ :create, :edit, :update, :destroy ]
  load_and_authorize_resource # Carga y autoriza el recurso automáticamente

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user # Asigna el usuario actual al comentario

    if @comment.save
      redirect_to @post, notice: "Comment was successfully created."
    else
      redirect_to @post, alert: "Error creating comment."
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @post, notice: "Comment was successfully updated."
    else
      render :edit # Renderiza la vista de edición si hay errores
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    # Verifica si el usuario tiene permiso para destruir el comentario
    authorize! :destroy, @comment

    @comment.destroy
    redirect_to @post, notice: "Comment was successfully deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:content) # Permite solo el contenido del comentario
  end
end
