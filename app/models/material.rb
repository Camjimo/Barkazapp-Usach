class Material < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :tipo_material
	  		belongs_to :unidad_medida
		
	# Validations
			 validates :nombre,:tipo_material,:unidad_medida,:unidad_medida2, :presence => { :message => "%{value} es un campo obligatorio."}
			# validates :pmp, <validations>
			# validates :cantidad, <validations>
			# validates :tipo_material, <validations>
			# validates :unidad_medida, <validations>
			# validates :unidad_medida2, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :nombre, -> (nombre) { where nombre: nombre }
		scope :pmp, -> (pmp) { where pmp: pmp }
		scope :cantidad, -> (cantidad) { where cantidad: cantidad }
		scope :tipo_material, -> (tipo_material_name) { where("tipo_material.name like ?", "%#{tipo_material_name}%") }
		scope :unidad_medida, -> (unidad_medida_name) { where("unidad_medida.name like ?", "%#{unidad_medida_name}%") }
		scope :unidad_medida2, -> (unidad_medida2) { where unidad_medida2: unidad_medida2 }
	
end
