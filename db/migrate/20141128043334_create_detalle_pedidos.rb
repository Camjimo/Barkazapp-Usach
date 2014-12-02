class CreateDetallePedidos < ActiveRecord::Migration
  def change
    create_table :detalle_pedidos do |t|
      t.integer :cantidad_venta
      t.integer :precio_venta
      t.boolean :nuevo
      t.references :pedido, index: true
      t.references :producto, index: true
    end
  end
end
