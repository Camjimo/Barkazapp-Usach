class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :nombre, limit: 50,:null => false
      t.integer :pmp
      t.integer :cantidad
      t.references :tipo_material, index: true,:null => false
      t.references :unidad_medida, index: true,:null => false
      t.integer :unidad_medida2,:null => false
    end
  end
end
