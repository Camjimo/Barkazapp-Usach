class Lote < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :material
	  		belongs_to :unidad_medida
		
	# Validations
			# validates :stock_original, <validations>
			# validates :stock_actual_bodega, <validations>
			# validates :stock_actual_cocina, <validations>
			# validates :stock_actual_bar, <validations>
			# validates :precio_compra, <validations>
			# validates :material, <validations>
			# validates :unidad_medida, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :stock_original, -> (stock_original) { where stock_original: stock_original }
		scope :stock_actual_bodega, -> (stock_actual_bodega) { where stock_actual_bodega: stock_actual_bodega }
		scope :stock_actual_cocina, -> (stock_actual_cocina) { where stock_actual_cocina: stock_actual_cocina }
		scope :stock_actual_bar, -> (stock_actual_bar) { where stock_actual_bar: stock_actual_bar }
		scope :precio_compra, -> (precio_compra) { where precio_compra: precio_compra }
		scope :material, -> (material_name) { where("material.name like ?", "%#{material_name}%") }
		scope :unidad_medida, -> (unidad_medida_name) { where("unidad_medida.name like ?", "%#{unidad_medida_name}%") }
	
end
