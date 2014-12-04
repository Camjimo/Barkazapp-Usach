class CreateEquivalencia < ActiveRecord::Migration
  def change
    create_table :equivalencia do |t|
      t.integer :cantidad,:null => false
      t.references :unidad_medida,:null => false, index: true
      t.references :tipo_contenedor,:null => false, index: true
    end
  end
end
