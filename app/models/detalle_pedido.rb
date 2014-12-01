class DetallePedido < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :pedido
	  		belongs_to :producto
		
	# Validations
			  validates :producto_id, :cantidad_venta, :presence => {:message => '%{value} es un campo obligatorio.'}
			  validates :cantidad_venta, :numericality => {greater_than: 0, :message => " debe ser mayor a 0."}
			# validates :precio_venta, <validations>
			# validates :pedido, <validations>
			# validates :producto, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :cantidad_venta, -> (cantidad_venta) { where cantidad_venta: cantidad_venta }
		scope :precio_venta, -> (precio_venta) { where precio_venta: precio_venta }
		scope :pedido, -> (pedido_name) { where("pedido.name like ?", "%#{pedido_name}%") }
		scope :producto, -> (producto_name) { where("producto.name like ?", "%#{producto_name}%") }
	
end
