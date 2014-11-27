class ProveedorsController < ApplicationController
  before_action :set_proveedor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @proveedors = Proveedor.all
    respond_with(@proveedors)
  end

  def show
    respond_with(@proveedor)
  end

  def new
    @proveedor = Proveedor.new
    respond_with(@proveedor)
  end

  def edit
  end

  def create
    @proveedor = Proveedor.new(proveedor_params)
    @proveedor.save
    respond_with(@proveedor)
  end

  def update
    @proveedor.update(proveedor_params)
    respond_with(@proveedor)
  end

  def destroy
    @proveedor.destroy
    respond_with(@proveedor)
  end

  private
    def set_proveedor
      @proveedor = Proveedor.find(params[:id])
    end

    def proveedor_params
      params.require(:proveedor).permit(:nombre, :telefono, :correo)
    end
end
