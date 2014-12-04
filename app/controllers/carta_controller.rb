class CartaController < ApplicationController
	
	def index
		@productos=Producto.all
	end

end
