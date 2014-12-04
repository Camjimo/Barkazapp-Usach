class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre, limit: 50,:null => false
      t.string :tipo, limit: 10,:null => false
      t.integer :precio,:null => false
      t.boolean :actual, :default => true,:null => false
      t.integer :costo
      t.boolean :nuevo, :default => true,:null => false
      t.string :clasificacion, :null => false, limit: 11
    end
  end
end
