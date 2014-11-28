class CreateDetalleCompras < ActiveRecord::Migration
  def change
    create_table :detalle_compras do |t|
      t.integer :cantidad_compra
      t.integer :precio_unidad_compra
      t.integer :total_compra
      t.date :fecha_vencimiento_lote
      t.references :material, index: true
      t.references :tipo_contenedor, index: true
      t.references :compra, index: true
    end
  end
end
