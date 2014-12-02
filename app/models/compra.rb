class Compra < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :proveedor
		
	# Validations
			# validates :monto_total, <validations>
			# validates :fecha, <validations>
			# validates :monto_iva, <validations>
			 validates :tipo,:proveedor, :presence => {:message => '%{value} es un campo obligatorio.'}
			# validates :proveedor, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :monto_total, -> (monto_total) { where monto_total: monto_total }
		scope :fecha, -> (fecha) { where fecha: fecha }
		scope :monto_iva, -> (monto_iva) { where monto_iva: monto_iva }
		scope :tipo, -> (tipo) { where tipo: tipo }
		scope :proveedor, -> (proveedor_name) { where("proveedor.name like ?", "%#{proveedor_name}%") }
	
end
