class RecetaController < ApplicationController
  before_action :set_recetum, only: [:show, :edit, :update, :destroy]
  before_action :set_producto, only: [:new]

  respond_to :html

  def index
    @receta = Recetum.all
    respond_with(@receta)
  end

  def show
    redirect_to producto_path(@recetum.producto_id)
    #respond_with(@recetum)
  end

  def new
    @recetum = Recetum.new
    respond_with(@recetum)
  end

  def edit
  end

  def create
    @recetum = Recetum.new(recetum_params)
    @recetum.save
    respond_with(@recetum)
  end

  def update
    @recetum.update(recetum_params)
    respond_with(@recetum)
  end

  def destroy
    @recetum.destroy
    respond_with(@recetum)
  end

  private

    def set_producto
      @producto = Producto.find(params[:id])
    end

    def set_recetum
      @recetum = Recetum.find(params[:id])
    end

    def recetum_params
      params.require(:recetum).permit(:cantidad_compuesto, :material_id, :producto_id)
    end
end
