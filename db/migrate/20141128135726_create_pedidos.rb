class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.datetime :fecha,:null => false
      t.integer :monto_total
      t.boolean :nuevo, :default => true,:null => false
      t.references :mesa,:null => false, index: true
      t.references :estado_pedido,:null => false, index: true
      t.references :tipo_pago,:null => false, index: true
      t.references :usuario,:null => false, index: true
    end
  end
end
