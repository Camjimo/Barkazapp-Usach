class InventarioDetallesController < ApplicationController
  before_action :set_inventario_detalle, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @inventario_detalles = InventarioDetalle.all
    respond_with(@inventario_detalles)
  end

  def show
    respond_with(@inventario_detalle)
  end

  def new
    @inventario_detalle = InventarioDetalle.new
    respond_with(@inventario_detalle)
  end

  def edit
  end

  def create
    @inventario_detalle = InventarioDetalle.new(inventario_detalle_params)
    @inventario_detalle.save
    respond_with(@inventario_detalle)
  end

  def update
    @inventario_detalle.update(inventario_detalle_params)
    respond_with(@inventario_detalle)
  end

  def destroy
    @inventario_detalle.destroy
    respond_with(@inventario_detalle)
  end

  private
    def set_inventario_detalle
      @inventario_detalle = InventarioDetalle.find(params[:id])
    end

    def inventario_detalle_params
      params.require(:inventario_detalle).permit(:stcok_local_material, :material_id, :inventario_id)
    end
end
