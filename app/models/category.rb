class Category < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

		
	# Validations
			# validates :name, <validations>
			# validates :description, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :byname, -> (name) { where("name like ?", "%#{name}%") }
		scope :description, -> (description) { where description: description }
	
end
