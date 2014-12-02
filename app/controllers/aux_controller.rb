class AuxController < ApplicationController

	respond_to :html

	def guardar
		@pedido = Pedido.find(params[:id])
		@pedido.update nuevo: false
		@detalle_pedidos = DetallePedido.where("pedido_id=? and nuevo=true",params[:id])
		@detalle_pedidos.update_all nuevo: false
	    redirect_to pedidos_path
	end

	def cancelar
		DetallePedido.where("pedido_id=? and nuevo=true",params[:id]).destroy_all
		redirect_to pedidos_path
	end

end
