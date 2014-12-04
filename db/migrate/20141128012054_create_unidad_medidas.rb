class CreateUnidadMedidas < ActiveRecord::Migration
  def change
    create_table :unidad_medidas do |t|
      t.string :nombre, limit: 50,:null => false
      t.string :simbolo, limit: 10,:null => false
    end
  end
end
