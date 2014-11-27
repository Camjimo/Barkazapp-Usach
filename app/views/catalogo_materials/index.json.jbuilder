json.array!(@catalogo_materials) do |catalogo_material|
  json.extract! catalogo_material, :id, :cantidad_material, :precio_material, :material_id, :unidad_medida_id, :proveedor_id
  json.url catalogo_material_url(catalogo_material, format: :json)
end
