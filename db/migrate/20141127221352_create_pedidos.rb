class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.datetime :fecha
      t.integer :monto_total
      t.references :mesa, index: true
      t.references :estado_pedido, index: true
      t.references :tipo_pago, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
