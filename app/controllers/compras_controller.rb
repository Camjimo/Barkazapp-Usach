class ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @compras = Compra.all
    respond_with(@compras)
  end

  def show
    @detalle_compras = DetalleCompra.where("compra_id=?",@compra.id)
    respond_with(@compra)
  end

  def new
    @compra = Compra.new
    respond_with(@compra)
  end

  def edit
  end

  def create
    @compra = Compra.new(compra_params)
    @compra.save
    respond_with(@compra)
  end

  def update
    @compra.update(compra_params)
    respond_with(@compra)
  end

  def destroy
    @compra.destroy
    respond_with(@compra)
  end

  private
    def set_compra
      @compra = Compra.find(params[:id])
    end

    def compra_params
      params.require(:compra).permit(:monto_total, :fecha, :monto_iva, :tipo, :proveedor_id)
    end
end
