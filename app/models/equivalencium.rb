class Equivalencium < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :unidad_medida
	  		belongs_to :tipo_contenedor
		
	# Validations
			 validates :cantidad,:unidad_medida,:tipo_contenedor, :presence => { :message => '%{value} es un campo obligatorio.'}
			# validates :unidad_medida, <validations>
			# validates :tipo_contenedor, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :cantidad, -> (cantidad) { where cantidad: cantidad }
		scope :unidad_medida, -> (unidad_medida_name) { where("unidad_medida.name like ?", "%#{unidad_medida_name}%") }
		scope :tipo_contenedor, -> (tipo_contenedor_name) { where("tipo_contenedor.name like ?", "%#{tipo_contenedor_name}%") }
	
end
