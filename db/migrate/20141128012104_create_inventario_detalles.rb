class CreateInventarioDetalles < ActiveRecord::Migration
  def change
    create_table :inventario_detalles do |t|
      t.integer :stcok_local_material,:null => false
      t.boolean :nuevo, :default => true,:null => false
      t.references :material,:null => false, index: true
      t.references :inventario,:null => false, index: true
    end
  end
end
