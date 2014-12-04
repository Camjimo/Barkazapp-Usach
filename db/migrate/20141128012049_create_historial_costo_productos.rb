class CreateHistorialCostoProductos < ActiveRecord::Migration
  def change
    create_table :historial_costo_productos do |t|
      t.integer :precio,:null => false
      t.date :fecha,:null => false
      t.references :producto,:null => false, index: true
    end
  end
end
