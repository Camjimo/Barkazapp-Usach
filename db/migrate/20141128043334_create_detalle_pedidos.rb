class CreateDetallePedidos < ActiveRecord::Migration
  def change
    create_table :detalle_pedidos do |t|
      t.integer :cantidad_venta,:null => false
      t.integer :precio_venta
      t.boolean :nuevo, :default => true,:null => false
      t.boolean :entregado, :default => false, :null => false
      t.references :pedido,:null => false, index: true
      t.references :producto,:null => false, index: true
    end
  end
end
