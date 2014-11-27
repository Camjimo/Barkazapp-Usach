json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nombre, :apellido, :pinpass, :rut, :estado, :tipo_usuario_id
  json.url usuario_url(usuario, format: :json)
end
