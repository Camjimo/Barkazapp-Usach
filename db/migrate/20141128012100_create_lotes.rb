class CreateLotes < ActiveRecord::Migration
  def change
    create_table :lotes do |t|
      t.integer :stock_original,:null => false
      t.integer :stock_actual_bodega,:null => false
      t.integer :stock_actual_cocina,:null => false, :default => 0
      t.integer :stock_actual_bar,:null => false, :default => 0
      t.integer :precio_compra,:null => false
      t.date :fecha_vencimiento, :null=>false
      t.references :material,:null => false, index: true
      t.references :unidad_medida,:null => false, index: true
    end
  end
end
