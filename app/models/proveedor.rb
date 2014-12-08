class Proveedor < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

		
	# Validations
			 validates :nombre, :presence => { :margin => "%{value} es un campo obligatorio." }
			# validates :telefono, <validations>
			# validates :correo, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :nombre, -> (nombre) { where nombre: nombre }
		scope :telefono, -> (telefono) { where telefono: telefono }
		scope :correo, -> (correo) { where correo: correo }
	
end
