class Mesa < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

		
	# Validations
			# validates :ocupada, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :ocupada, -> (ocupada) { where ocupada: ocupada }
	
end
