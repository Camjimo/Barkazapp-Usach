json.array!(@tipo_materials) do |tipo_material|
  json.extract! tipo_material, :id, :nombre
  json.url tipo_material_url(tipo_material, format: :json)
end
