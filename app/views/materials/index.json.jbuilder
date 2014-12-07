json.array!(@materials) do |material|
  json.extract! material, :id, :nombre, :pmp, :cantidad, :tipo_material_id, :unidad_medida_id, :unidad_medida2
  json.url material_url(material, format: :json)
end
