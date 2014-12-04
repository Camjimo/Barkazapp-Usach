class CreateReceta < ActiveRecord::Migration
  def change
    create_table :receta do |t|
      t.integer :cantidad_compuesto,:null => false
      t.boolean :nuevo, :default => true,:null => false
      t.references :material,:null => false, index: true
      t.references :producto,:null => false, index: true
    end
  end
end
