json.array!(@tipo_contenedors) do |tipo_contenedor|
  json.extract! tipo_contenedor, :id, :nombre
  json.url tipo_contenedor_url(tipo_contenedor, format: :json)
end
