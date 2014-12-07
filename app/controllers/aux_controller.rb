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
		@detalle_pedidos = DetallePedido.where("pedido_id=?",params[:id])
		@detalle_pedidos.update_all entregado: true
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
		@detalle_compras = DetalleCompra.where("compra_id=?",@compra.id)
		@detalle_compras.update_all nuevo: false
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

	def guardar_inventario
		@inventario = Inventario.find(params[:id])
		@inventario.update nuevo: false
		@inventario_detalles = InventarioDetalle.where('inventario_id=?',params[:id])
		@inventario_detalles.update_all nuevo: false
		redirect_to inventarios_path
	end

	def cancelar_inventario
		InventarioDetalle.where("inventario_id=? and nuevo=true",params[:id]).destroy_all
		redirect_to inventarios_path
	end

	def eliminar_inventario_nuevo	
		InventarioDetalle.where("inventario_id=? and nuevo=true",params[:id]).destroy_all
		@inventario = Inventario.find(params[:id])
		@inventario.destroy
	    redirect_to inventarios_path
	end
	
	def eliminar_inventario
		InventarioDetalle.where("inventario_id=?",params[:id]).destroy_all
		@inventario = Inventario.find(params[:id])
		@inventario.destroy
	    redirect_to inventarios_path
	end
end
