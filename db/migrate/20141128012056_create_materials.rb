class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :nombre, limit: 50,:null => false
      t.integer :pmp
      t.integer :cantidad
      t.integer :unidad_medida2, index: true,:null => false
      t.references :tipo_material,:null => false, index: true
      t.references :unidad_medida,:null => false, index: true
    end
  end
end
