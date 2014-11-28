json.array!(@detalle_pedidos) do |detalle_pedido|
  json.extract! detalle_pedido, :id, :cantidad_venta, :precio_venta, :pedido_id, :producto_id
  json.url detalle_pedido_url(detalle_pedido, format: :json)
end
