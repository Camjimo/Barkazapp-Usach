class TipoContenedorsController < ApplicationController
  before_action :set_tipo_contenedor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tipo_contenedors = TipoContenedor.all
    respond_with(@tipo_contenedors)
  end

  def show
    respond_with(@tipo_contenedor)
  end

  def new
    @tipo_contenedor = TipoContenedor.new
    respond_with(@tipo_contenedor)
  end

  def edit
  end

  def create
    @tipo_contenedor = TipoContenedor.new(tipo_contenedor_params)
    @tipo_contenedor.save
    respond_with(@tipo_contenedor)
  end

  def update
    @tipo_contenedor.update(tipo_contenedor_params)
    respond_with(@tipo_contenedor)
  end

  def destroy
    @tipo_contenedor.destroy
    respond_with(@tipo_contenedor)
  end

  private
    def set_tipo_contenedor
      @tipo_contenedor = TipoContenedor.find(params[:id])
    end

    def tipo_contenedor_params
      params.require(:tipo_contenedor).permit(:nombre)
    end
end
