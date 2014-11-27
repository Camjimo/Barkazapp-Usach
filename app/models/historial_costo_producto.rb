class HistorialCostoProducto < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :producto
		
	# Validations
			# validates :precio, <validations>
			# validates :fecha, <validations>
			# validates :producto, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :precio, -> (precio) { where precio: precio }
		scope :fecha, -> (fecha) { where fecha: fecha }
		scope :producto, -> (producto_name) { where("producto.name like ?", "%#{producto_name}%") }
	
end
