json.array!(@historial_costo_productos) do |historial_costo_producto|
  json.extract! historial_costo_producto, :id, :precio, :fecha, :producto_id
  json.url historial_costo_producto_url(historial_costo_producto, format: :json)
end
