class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pedidos = Pedido.all
    respond_with(@pedidos)
  end

  def show
    @detalle_pedidos = DetallePedido.all.where(["pedido_id = ?",@pedido.id])
    respond_with(@pedido)
  end

  def new
    @pedido = Pedido.new
    respond_with(@pedido)
  end

  def edit
  end

  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.update usuario_id: current_user.id
    @pedido.update estado_pedido_id: 1
    @pedido.update fecha: Time.now - 3.hour
    @pedido.save
    respond_with(@pedido)
  end

  def update
    @pedido.update(pedido_params)
    respond_with(@pedido)
  end

  def destroy
    DetallePedido.where(["pedido_id=?",@pedido.id]).destroy_all
    @pedido.destroy
    respond_with(@pedido)
  end

  private
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    def pedido_params
      params.require(:pedido).permit(:fecha, :monto_total, :mesa_id, :estado_pedido_id, :tipo_pago_id, :usuario_id)
    end
end
