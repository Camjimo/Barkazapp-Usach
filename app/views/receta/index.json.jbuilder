json.array!(@receta) do |recetum|
  json.extract! recetum, :id, :cantidad_compuesto, :material_id, :producto_id
  json.url recetum_url(recetum, format: :json)
end
