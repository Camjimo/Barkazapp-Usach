class DetalleComprasController < ApplicationController
  before_action :set_detalle_compra, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @detalle_compras = DetalleCompra.all
    respond_with(@detalle_compras)
  end

  def show
    respond_with(@detalle_compra)
  end

  def new
    @detalle_compra = DetalleCompra.new
    respond_with(@detalle_compra)
  end

  def edit
  end

  def create
    @detalle_compra = DetalleCompra.new(detalle_compra_params)
    @detalle_compra.save
    respond_with(@detalle_compra)
  end

  def update
    @detalle_compra.update(detalle_compra_params)
    respond_with(@detalle_compra)
  end

  def destroy
    @detalle_compra.destroy
    respond_with(@detalle_compra)
  end

  private
    def set_detalle_compra
      @detalle_compra = DetalleCompra.find(params[:id])
    end

    def detalle_compra_params
      params.require(:detalle_compra).permit(:cantidad_compra, :precio_unidad_compra, :total_compra, :fecha_vencimiento_lote, :material_id, :tipo_contenedor_id, :compra_id)
    end
end
