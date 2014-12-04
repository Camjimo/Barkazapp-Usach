class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :nombre, limit: 50,:null => false
      t.integer :telefono
      t.string :correo, limit: 100
      t.boolean :nuevo, :default => true
    end
  end
end
