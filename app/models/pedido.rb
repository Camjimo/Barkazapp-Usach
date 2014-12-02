class Pedido < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :mesa
	  		#validates :mesa_id, presence: true, inclusion: {in: %w(small medium large), message: "%{value} es un campo obligatorio."}
	  		validates :mesa_id, :presence => {:message => '%{value} es un campo obligatorio.'}
	  		belongs_to :estado_pedido
	  		belongs_to :tipo_pago
	  		belongs_to :usuario
	  		belongs_to :detalle_pedido
		
	# Validations
			# validates :fecha, <validations>
			# validates :monto_total, <validations>
			# validates :mesa, <validations>
			# validates :estado_pedido, <validations>
			# validates :tipo_pago, <validations>
			# validates :usuario, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :fecha, -> (fecha) { where fecha: fecha }
		scope :monto_total, -> (monto_total) { where monto_total: monto_total }
		scope :mesa, -> (mesa_name) { where("mesa.name like ?", "%#{mesa_name}%") }
		scope :estado_pedido, -> (estado_pedido_name) { where("estado_pedido.name like ?", "%#{estado_pedido_name}%") }
		scope :tipo_pago, -> (tipo_pago_name) { where("tipo_pago.name like ?", "%#{tipo_pago_name}%") }
		scope :usuario, -> (usuario_name) { where("usuario.name like ?", "%#{usuario_name}%") }
	
end
