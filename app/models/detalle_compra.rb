class DetalleCompra < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :material
	  		belongs_to :tipo_contenedor
	  		belongs_to :compra
		
	# Validations
			validates :material_id, :cantidad_compra, :tipo_contenedor_id, :precio_unidad_compra, :presence => {:message => "%{value} es un campo obligatorio."}
			validates :cantidad_compra, :precio_unidad_compra, :numericality => {greater_than: 0, :message => " debe ser mayor a 0."}
			# validates :cantidad_compra, <validations>
			# validates :precio_unidad_compra, <validations>
			# validates :total_compra, <validations>
			# validates :fecha_vencimiento_lote, <validations>
			# validates :material, <validations>
			# validates :tipo_contenedor, <validations>
			# validates :compra, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :cantidad_compra, -> (cantidad_compra) { where cantidad_compra: cantidad_compra }
		scope :precio_unidad_compra, -> (precio_unidad_compra) { where precio_unidad_compra: precio_unidad_compra }
		scope :total_compra, -> (total_compra) { where total_compra: total_compra }
		scope :fecha_vencimiento_lote, -> (fecha_vencimiento_lote) { where fecha_vencimiento_lote: fecha_vencimiento_lote }
		scope :material, -> (material_name) { where("material.name like ?", "%#{material_name}%") }
		scope :tipo_contenedor, -> (tipo_contenedor_name) { where("tipo_contenedor.name like ?", "%#{tipo_contenedor_name}%") }
		scope :compra, -> (compra_name) { where("compra.name like ?", "%#{compra_name}%") }
	
end
