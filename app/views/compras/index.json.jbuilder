json.array!(@compras) do |compra|
  json.extract! compra, :id, :monto_total, :fecha, :monto_iva, :tipo, :proveedor_id
  json.url compra_url(compra, format: :json)
end
