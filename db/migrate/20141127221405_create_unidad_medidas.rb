class CreateUnidadMedidas < ActiveRecord::Migration
  def change
    create_table :unidad_medidas do |t|
      t.string :nombre, limit: 50
      t.string :simbolo, limit: 10

      t.timestamps
    end
  end
end
