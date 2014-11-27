class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @usuarios = Usuario.all
    respond_with(@usuarios)
  end

  def show
    respond_with(@usuario)
  end

  def new
    @usuario = Usuario.new
    respond_with(@usuario)
  end

  def edit
  end

  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.save
    respond_with(@usuario)
  end

  def update
    @usuario.update(usuario_params)
    respond_with(@usuario)
  end

  def destroy
    @usuario.destroy
    respond_with(@usuario)
  end

  private
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    def usuario_params
      params.require(:usuario).permit(:nombre, :apellido, :pinpass, :rut, :estado, :tipo_usuario_id)
    end
end
