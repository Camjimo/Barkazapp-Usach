class CreateDetalleCompras < ActiveRecord::Migration
  def change
    create_table :detalle_compras do |t|
      t.integer :cantidad_compra,:null => false
      t.integer :precio_unidad_compra,:null => false
      t.integer :total_compra
      t.date :fecha_vencimiento_lote,:null => false
      t.references :material,:null => false, index: true
      t.references :tipo_contenedor,:null => false, index: true
      t.references :compra,:null => false, index: true
    end
  end
end
