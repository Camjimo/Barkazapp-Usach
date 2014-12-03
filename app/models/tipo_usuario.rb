class TipoUsuario < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

		
	# Validations
			# validates :nombre, <validations>
			validates :nombre, :presence => {:message => "%{value} es un campo obligatorio."}
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :nombre, -> (nombre) { where nombre: nombre }
	
end
