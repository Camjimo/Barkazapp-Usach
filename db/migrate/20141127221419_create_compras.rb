class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.integer :monto_total
      t.datetime :fecha
      t.integer :monto_iva
      t.string :tipo, limit: 10
      t.references :proveedor, index: true

      t.timestamps
    end
  end
end
