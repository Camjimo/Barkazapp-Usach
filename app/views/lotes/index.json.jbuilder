json.array!(@lotes) do |lote|
  json.extract! lote, :id, :stock_original, :stock_actual_bodega, :stock_actual_cocina, :stock_actual_bar, :precio_compra, :material_id, :unidad_medida_id
  json.url lote_url(lote, format: :json)
end
