class Producto < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	# Validations
			# validates :nombre, <validations>
			# validates :tipo, <validations>
			# validates :precio, <validations>
			# validates :actual, <validations>
			# validates :costo, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :nombre, -> (nombre) { where nombre: nombre }
		scope :tipo, -> (tipo) { where tipo: tipo }
		scope :precio, -> (precio) { where precio: precio }
		scope :actual, -> (actual) { where actual: actual }
		scope :costo, -> (costo) { where costo: costo }
	
end
