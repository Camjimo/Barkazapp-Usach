class UnidadMedida < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

		
	# Validations
			validates :nombre, :simbolo, :presence => {:message => "%{value} es un campo obligatorio."}
			# validates :simbolo, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :nombre, -> (nombre) { where nombre: nombre }
		scope :simbolo, -> (simbolo) { where simbolo: simbolo }
	
end
