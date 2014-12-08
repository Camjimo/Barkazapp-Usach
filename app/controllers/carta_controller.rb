class CartaController < ApplicationController
	
	def index
		@productosPlatos = Producto.where("clasificacion='Platos'")
		@productosParaPicar = Producto.where("clasificacion='Para picar'")
		@productosPlatos = Producto.where("clasificacion='Platos'")
		@productosFajitas = Producto.where("clasificacion='Fajitas'")
		@productosBraseros = Producto.where("clasificacion='Braseros'")
		@productosPostres = Producto.where("clasificacion='Postres'")
		@productosBarra = Producto.where("clasificacion='Barra'")
	end

end
