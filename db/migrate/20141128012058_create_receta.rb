class CreateReceta < ActiveRecord::Migration
  def change
    create_table :receta do |t|
      t.integer :cantidad_compuesto
      t.references :material, index: true
      t.references :producto, index: true
    end
  end
end
