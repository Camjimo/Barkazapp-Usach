class AuxController < ApplicationController

	respond_to :html

	def guardar_pedido
		@pedido = Pedido.find(params[:id])
		@pedido.update nuevo: false
		@detalle_pedidos = DetallePedido.where("pedido_id=? and nuevo=true",params[:id])
		@detalle_pedidos.update_all nuevo: false
	    redirect_to pedidos_path
	end

	def cancelar_pedido
		DetallePedido.where("pedido_id=? and nuevo=true",params[:id]).destroy_all
		redirect_to pedidos_path
	end

	def entregar_pedido
		@pedido = Pedido.find(params[:id])
		@pedido.update estado_pedido_id: 2
		redirect_to pedidos_path
	end

	def finalizar_pedido
		@pedido = Pedido.find(params[:id])
		@pedido.update estado_pedido_id: 3
		redirect_to pedidos_path
	end

	def guardar_compra
		@compra = Compra.find(params[:id])
		@compra.update nuevo: false
		redirect_to compras_path
	end

	def guardar_producto
		@producto = Producto.find(params[:id])
		@producto.update nuevo: false
		@recetas = Recetum.where("producto_id=? and nuevo=true",params[:id])
		@recetas.update_all nuevo: false
	    redirect_to productos_path
	end

	def cancelar_producto
		Recetum.where("producto_id=? and nuevo=true",params[:id]).destroy_all
		redirect_to productos_path
	end
	
end
