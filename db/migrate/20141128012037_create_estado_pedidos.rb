class CreateEstadoPedidos < ActiveRecord::Migration
  def change
    create_table :estado_pedidos do |t|
      t.string :nombre, limit: 50
    end
  end
end
