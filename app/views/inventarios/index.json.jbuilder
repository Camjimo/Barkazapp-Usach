json.array!(@inventarios) do |inventario|
  json.extract! inventario, :id, :fecha, :hora, :tipo
  json.url inventario_url(inventario, format: :json)
end
