class InventariosController < ApplicationController
  before_action :set_inventario, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @inventarios = Inventario.all
    respond_with(@inventarios)
  end

  def show
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
    @inventario.save
    respond_with(@inventario)
  end

  def update
    @inventario.update(inventario_params)
    respond_with(@inventario)
  end

  def destroy
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
