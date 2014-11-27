json.array!(@proveedors) do |proveedor|
  json.extract! proveedor, :id, :nombre, :telefono, :correo
  json.url proveedor_url(proveedor, format: :json)
end
