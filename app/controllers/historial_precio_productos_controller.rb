class HistorialPrecioProductosController < ApplicationController
  before_action :set_historial_precio_producto, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @historial_precio_productos = HistorialPrecioProducto.all
    respond_with(@historial_precio_productos)
  end

  def show
    respond_with(@historial_precio_producto)
  end

  def new
    @historial_precio_producto = HistorialPrecioProducto.new
    respond_with(@historial_precio_producto)
  end

  def edit
  end

  def create
    @historial_precio_producto = HistorialPrecioProducto.new(historial_precio_producto_params)
    @historial_precio_producto.save
    respond_with(@historial_precio_producto)
  end

  def update
    @historial_precio_producto.update(historial_precio_producto_params)
    respond_with(@historial_precio_producto)
  end

  def destroy
    @historial_precio_producto.destroy
    respond_with(@historial_precio_producto)
  end

  private
    def set_historial_precio_producto
      @historial_precio_producto = HistorialPrecioProducto.find(params[:id])
    end

    def historial_precio_producto_params
      params.require(:historial_precio_producto).permit(:precio, :fecha, :producto_id)
    end
end
