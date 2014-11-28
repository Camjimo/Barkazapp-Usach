class CreateHistorialCostoProductos < ActiveRecord::Migration
  def change
    create_table :historial_costo_productos do |t|
      t.integer :precio
      t.date :fecha
      t.references :producto, index: true
    end
  end
end
