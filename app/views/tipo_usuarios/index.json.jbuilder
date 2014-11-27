json.array!(@tipo_usuarios) do |tipo_usuario|
  json.extract! tipo_usuario, :id, :nombre
  json.url tipo_usuario_url(tipo_usuario, format: :json)
end
