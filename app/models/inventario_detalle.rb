class InventarioDetalle < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :material
	  		belongs_to :inventario
		
	# Validations
			# validates :stcok_local_material, <validations>
			# validates :material, <validations>
			# validates :inventario, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :stcok_local_material, -> (stcok_local_material) { where stcok_local_material: stcok_local_material }
		scope :material, -> (material_name) { where("material.name like ?", "%#{material_name}%") }
		scope :inventario, -> (inventario_name) { where("inventario.name like ?", "%#{inventario_name}%") }
	
end
