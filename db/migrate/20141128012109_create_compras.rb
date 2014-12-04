class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.integer :monto_total
      t.datetime :fecha
      t.integer :monto_iva
      t.boolean :nuevo, :default => true
      t.string :tipo, limit: 10
      t.references :proveedor, index: true
    end
  end
end
