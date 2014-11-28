class DetallePedidosController < ApplicationController
  before_action :set_detalle_pedido, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @detalle_pedidos = DetallePedido.all
    respond_with(@detalle_pedidos)
  end

  def show
    respond_with(@detalle_pedido)
  end

  def new
    @detalle_pedido = DetallePedido.new
    respond_with(@detalle_pedido)
  end

  def edit
  end

  def create
    @detalle_pedido = DetallePedido.new(detalle_pedido_params)
    @detalle_pedido.save
    respond_with(@detalle_pedido)
  end

  def update
    @detalle_pedido.update(detalle_pedido_params)
    respond_with(@detalle_pedido)
  end

  def destroy
    @detalle_pedido.destroy
    respond_with(@detalle_pedido)
  end

  private
    def set_detalle_pedido
      @detalle_pedido = DetallePedido.find(params[:id])
    end

    def detalle_pedido_params
      params.require(:detalle_pedido).permit(:cantidad_venta, :precio_venta, :pedido_id, :producto_id)
    end
end
