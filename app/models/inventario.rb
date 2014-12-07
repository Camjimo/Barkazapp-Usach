class Inventario < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

		
	# Validations
			# validates :fecha, <validations>
			# validates :hora, <validations>
			 validates :tipo, :presence => {:message => '%{value} es un campo obigatorio.'}
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :fecha, -> (fecha) { where fecha: fecha }
		scope :hora, -> (hora) { where hora: hora }
		scope :tipo, -> (tipo) { where tipo: tipo }
	
end
