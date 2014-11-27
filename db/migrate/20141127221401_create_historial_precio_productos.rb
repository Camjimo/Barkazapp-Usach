class CreateHistorialPrecioProductos < ActiveRecord::Migration
  def change
    create_table :historial_precio_productos do |t|
      t.integer :precio
      t.date :fecha
      t.references :producto, index: true

      t.timestamps
    end
  end
end
