json.array!(@historial_precio_productos) do |historial_precio_producto|
  json.extract! historial_precio_producto, :id, :precio, :fecha, :producto_id
  json.url historial_precio_producto_url(historial_precio_producto, format: :json)
end
