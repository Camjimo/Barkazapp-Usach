class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre, limit: 50
      t.string :apellido, limit: 50
      t.string :pinpass
      t.string :rut, limit: 11
      t.string :estado, limit: 15
      t.references :tipo_usuario, index: true
    end
  end
end
