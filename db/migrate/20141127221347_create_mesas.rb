class CreateMesas < ActiveRecord::Migration
  def change
    create_table :mesas do |t|
      t.boolean :ocupada

      t.timestamps
    end
  end
end
