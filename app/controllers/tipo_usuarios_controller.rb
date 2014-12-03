class TipoUsuariosController < ApplicationController
  before_action :set_tipo_usuario, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tipo_usuarios = TipoUsuario.all
    respond_with(@tipo_usuarios)
  end

  def show
    #respond_with(@tipo_usuario)
    redirect_to tipo_usuarios_path
  end

  def new
    @tipo_usuario = TipoUsuario.new
    respond_with(@tipo_usuario)
  end

  def edit
  end

  def create
    @tipo_usuario = TipoUsuario.new(tipo_usuario_params)
    @tipo_usuario.save
    respond_with(@tipo_usuario)
  end

  def update
    @tipo_usuario.update(tipo_usuario_params)
    respond_with(@tipo_usuario)
  end

  def destroy
    @tipo_usuario.destroy
    respond_with(@tipo_usuario)
  end

  private
    def set_tipo_usuario
      @tipo_usuario = TipoUsuario.find(params[:id])
    end

    def tipo_usuario_params
      params.require(:tipo_usuario).permit(:nombre)
    end
end
