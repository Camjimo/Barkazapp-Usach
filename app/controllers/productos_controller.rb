class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @productos = Producto.all
    respond_with(@productos)
  end

  def show
    @recetas = Recetum.all.where("producto_id=?",@producto.id)
    respond_with(@producto)
  end

  def new
    @producto = Producto.new
    respond_with(@producto)
  end

  def edit
  end

  def create
    @producto = Producto.new(producto_params)
    @producto.save
    respond_with(@producto)
  end

  def update
    @producto.update(producto_params)
    respond_with(@producto)
  end

  def destroy
    Recetum.where("producto_id=?",@producto.id).destroy_all
    @producto.destroy
    respond_with(@producto)
  end

  private
    def set_producto
      @producto = Producto.find(params[:id])
    end

    def producto_params
      params.require(:producto).permit(:nombre, :tipo, :precio, :actual, :costo, :clasificacion)
    end
end
