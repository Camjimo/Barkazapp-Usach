class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.datetime :fecha
      t.integer :monto_total
      t.boolean :nuevo, :default => true,:null => false
      t.references :mesa,:null => false, index: true
      t.references :estado_pedido,:null => false, index: true, :default => 1
      t.references :tipo_pago, index: true
      t.references :usuario, index: true
    end
  end
end
