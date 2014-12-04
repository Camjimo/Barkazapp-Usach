class EstadoPedidosController < ApplicationController
  before_action :set_estado_pedido, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @estado_pedidos = EstadoPedido.all
    respond_with(@estado_pedidos)
  end

  def show
    #respond_with(@estado_pedido)
    redirect_to estado_pedidos_path
  end

  def new
    @estado_pedido = EstadoPedido.new
    respond_with(@estado_pedido)
  end

  def edit
  end

  def create
    @estado_pedido = EstadoPedido.new(estado_pedido_params)
    @estado_pedido.save
    respond_with(@estado_pedido)
  end

  def update
    @estado_pedido.update(estado_pedido_params)
    respond_with(@estado_pedido)
  end

  def destroy
    @estado_pedido.destroy
    respond_with(@estado_pedido)
  end

  private
    def set_estado_pedido
      @estado_pedido = EstadoPedido.find(params[:id])
    end

    def estado_pedido_params
      params.require(:estado_pedido).permit(:nombre)
    end
end
