class Product < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :category
		
	# Validations
			# validates :name, <validations>
			# validates :description, <validations>
			# validates :category, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :byname, -> (name) { where("name like ?", "%#{name}%") }
		scope :description, -> (description) { where description: description }
		scope :category, -> (category_name) { where("category.name like ?", "%#{category_name}%") }
	
end
