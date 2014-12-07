class InventariosController < ApplicationController
  before_action :set_inventario, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @inventarios = Inventario.all
    respond_with(@inventarios)
  end

  def show
    @detalle_inventarios = InventarioDetalle.all.where('inventario_id=?',@inventario.id)
    respond_with(@inventario)
  end

  def new
    @inventario = Inventario.new
    respond_with(@inventario)
  end

  def edit
  end

  def create
    @inventario = Inventario.new(inventario_params)
    @inventario.update fecha: Time.now-3.hour
    @inventario.save
    respond_with(@inventario)
  end

  def update
    @inventario.update(inventario_params)
    respond_with(@inventario)
  end

  def destroy
    DetalleInventario.where(["inventario_id=?",@inventario.id]).destroy_all
    @inventario.destroy
    respond_with(@inventario)
  end

  private
    def set_inventario
      @inventario = Inventario.find(params[:id])
    end

    def inventario_params
      params.require(:inventario).permit(:fecha, :hora, :tipo)
    end
end
