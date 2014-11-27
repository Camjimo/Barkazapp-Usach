class CatalogoMaterial < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :material
	  		belongs_to :unidad_medida
	  		belongs_to :proveedor
		
	# Validations
			# validates :cantidad_material, <validations>
			# validates :precio_material, <validations>
			# validates :material, <validations>
			# validates :unidad_medida, <validations>
			# validates :proveedor, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :cantidad_material, -> (cantidad_material) { where cantidad_material: cantidad_material }
		scope :precio_material, -> (precio_material) { where precio_material: precio_material }
		scope :material, -> (material_name) { where("material.name like ?", "%#{material_name}%") }
		scope :unidad_medida, -> (unidad_medida_name) { where("unidad_medida.name like ?", "%#{unidad_medida_name}%") }
		scope :proveedor, -> (proveedor_name) { where("proveedor.name like ?", "%#{proveedor_name}%") }
	
end
