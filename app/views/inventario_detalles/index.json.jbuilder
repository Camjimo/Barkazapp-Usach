json.array!(@inventario_detalles) do |inventario_detalle|
  json.extract! inventario_detalle, :id, :stcok_local_material, :material_id, :inventario_id
  json.url inventario_detalle_url(inventario_detalle, format: :json)
end
