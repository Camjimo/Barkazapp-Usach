class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :nombre, limit: 50
      t.integer :pmp
      t.integer :cantidad
      t.references :tipo_material, index: true
      t.references :unidad_medida, index: true
      t.references :unidad_medida, index: true

      t.timestamps
    end
  end
end
