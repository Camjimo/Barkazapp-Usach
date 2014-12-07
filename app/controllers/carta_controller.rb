class CartaController < ApplicationController
	
	def index
		@productos=Producto.all
		@productosPlatos = Producto.where("clasificacion='Platos'")
		@productosParaPicar = Producto.where("clasificacion='Para picar'")
			
	end

end
