class CreateTipoUsuarios < ActiveRecord::Migration
  def change
    create_table :tipo_usuarios do |t|
      t.string :nombre, limit: 50,:null => false
    end
  end
end
