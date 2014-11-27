class CreateTipoContenedors < ActiveRecord::Migration
  def change
    create_table :tipo_contenedors do |t|
      t.string :nombre, limit: 50

      t.timestamps
    end
  end
end
