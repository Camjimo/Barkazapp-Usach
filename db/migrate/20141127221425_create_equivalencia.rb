class CreateEquivalencia < ActiveRecord::Migration
  def change
    create_table :equivalencia do |t|
      t.integer :cantidad
      t.references :unidad_medida, index: true
      t.references :tipo_contenedor, index: true

      t.timestamps
    end
  end
end
