class CreateLotes < ActiveRecord::Migration
  def change
    create_table :lotes do |t|
      t.integer :stock_original
      t.integer :stock_actual_bodega
      t.integer :stock_actual_cocina
      t.integer :stock_actual_bar
      t.integer :precio_compra
      t.references :material, index: true
      t.references :unidad_medida, index: true
    end
  end
end
