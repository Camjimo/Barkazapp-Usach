class CreateCatalogoMaterials < ActiveRecord::Migration
  def change
    create_table :catalogo_materials do |t|
      t.integer :cantidad_material
      t.integer :precio_material
      t.references :material, index: true
      t.references :unidad_medida, index: true
      t.references :proveedor, index: true

      t.timestamps
    end
  end
end
