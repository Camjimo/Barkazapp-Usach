json.array!(@equivalencia) do |equivalencium|
  json.extract! equivalencium, :id, :cantidad, :unidad_medida_id, :tipo_contenedor_id
  json.url equivalencium_url(equivalencium, format: :json)
end
