class CreateTipoMaterials < ActiveRecord::Migration
  def change
    create_table :tipo_materials do |t|
      t.string :nombre, limit: 50
    end
  end
end
