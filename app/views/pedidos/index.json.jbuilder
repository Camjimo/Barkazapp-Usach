json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :fecha, :monto_total, :mesa_id, :estado_pedido_id, :tipo_pago_id, :usuario_id
  json.url pedido_url(pedido, format: :json)
end
