class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.integer :monto_total
      t.datetime :fecha,:null => false
      t.integer :monto_iva
      t.boolean :nuevo, :default => true,:null => false
      t.string :tipo, limit: 10,:null => false
      t.references :proveedor,:null => false, index: true
    end
  end
end
