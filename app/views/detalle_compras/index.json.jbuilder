json.array!(@detalle_compras) do |detalle_compra|
  json.extract! detalle_compra, :id, :cantidad_compra, :precio_unidad_compra, :total_compra, :fecha_vencimiento_lote, :material_id, :tipo_contenedor_id, :compra_id
  json.url detalle_compra_url(detalle_compra, format: :json)
end
