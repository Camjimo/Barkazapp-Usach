class LotesController < ApplicationController
  before_action :set_lote, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @lotes = Lote.all
    respond_with(@lotes)
  end

  def show
    redirect_to lotes_path
    #respond_with(@lote)
  end

  def new
    @lote = Lote.new
    respond_with(@lote)
  end

  def edit
  end

  def create
    @lote = Lote.new(lote_params)
    @lote.save
    respond_with(@lote)
  end

  def update
    @lote.update(lote_params)
    respond_with(@lote)
  end

  def destroy
    @lote.destroy
    respond_with(@lote)
  end

  private
    def set_lote
      @lote = Lote.find(params[:id])
    end

    def lote_params
      params.require(:lote).permit(:stock_original, :stock_actual_bodega, :stock_actual_cocina, :stock_actual_bar, :precio_compra, :material_id, :unidad_medida_id)
    end
end
