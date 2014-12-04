class CreateCatalogoMaterials < ActiveRecord::Migration
  def change
    create_table :catalogo_materials do |t|
      t.integer :cantidad_material,:null => false
      t.integer :precio_material,:null => false
      t.integer :nuevo, :default => true,:null => false
      t.references :material,:null => false, index: true
      t.references :unidad_medida,:null => false, index: true
      t.references :proveedor,:null => false, index: true
    end
  end
end
