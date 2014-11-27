json.array!(@productos) do |producto|
  json.extract! producto, :id, :nombre, :tipo, :precio, :actual, :costo
  json.url producto_url(producto, format: :json)
end
