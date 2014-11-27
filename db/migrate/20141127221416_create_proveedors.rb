class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :nombre, limit: 50
      t.integer :telefono
      t.string :correo, limit: 100

      t.timestamps
    end
  end
end
