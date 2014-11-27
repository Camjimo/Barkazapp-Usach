class HistorialCostoProductosController < ApplicationController
  before_action :set_historial_costo_producto, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @historial_costo_productos = HistorialCostoProducto.all
    respond_with(@historial_costo_productos)
  end

  def show
    respond_with(@historial_costo_producto)
  end

  def new
    @historial_costo_producto = HistorialCostoProducto.new
    respond_with(@historial_costo_producto)
  end

  def edit
  end

  def create
    @historial_costo_producto = HistorialCostoProducto.new(historial_costo_producto_params)
    @historial_costo_producto.save
    respond_with(@historial_costo_producto)
  end

  def update
    @historial_costo_producto.update(historial_costo_producto_params)
    respond_with(@historial_costo_producto)
  end

  def destroy
    @historial_costo_producto.destroy
    respond_with(@historial_costo_producto)
  end

  private
    def set_historial_costo_producto
      @historial_costo_producto = HistorialCostoProducto.find(params[:id])
    end

    def historial_costo_producto_params
      params.require(:historial_costo_producto).permit(:precio, :fecha, :producto_id)
    end
end
