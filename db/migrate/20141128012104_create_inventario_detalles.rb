class CreateInventarioDetalles < ActiveRecord::Migration
  def change
    create_table :inventario_detalles do |t|
      t.integer :stcok_local_material
      t.references :material, index: true
      t.references :inventario, index: true
    end
  end
end
