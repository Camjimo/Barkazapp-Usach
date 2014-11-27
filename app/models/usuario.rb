class Usuario < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :tipo_usuario
		
	# Validations
			# validates :nombre, <validations>
			# validates :apellido, <validations>
			# validates :pinpass, <validations>
			# validates :rut, <validations>
			# validates :estado, <validations>
			# validates :tipo_usuario, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :nombre, -> (nombre) { where nombre: nombre }
		scope :apellido, -> (apellido) { where apellido: apellido }
		scope :pinpass, -> (pinpass) { where pinpass: pinpass }
		scope :rut, -> (rut) { where rut: rut }
		scope :estado, -> (estado) { where estado: estado }
		scope :tipo_usuario, -> (tipo_usuario_name) { where("tipo_usuario.name like ?", "%#{tipo_usuario_name}%") }
	
end
