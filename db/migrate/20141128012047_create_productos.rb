class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre, limit: 50
      t.string :tipo, limit: 10
      t.integer :precio
      t.boolean :actual
      t.integer :costo
    end
  end
end
