class Recetum < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :material
	  		belongs_to :producto
		
	# Validations
			 validates :cantidad_compuesto, :material, :presence => { :message => "%{value} es un campo obligatorio." }
			# validates :material, <validations>
			# validates :producto, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :cantidad_compuesto, -> (cantidad_compuesto) { where cantidad_compuesto: cantidad_compuesto }
		scope :material, -> (material_name) { where("material.name like ?", "%#{material_name}%") }
		scope :producto, -> (producto_name) { where("producto.name like ?", "%#{producto_name}%") }
	
end
