class CreateMesas < ActiveRecord::Migration
  def change
    create_table :mesas do |t|
      t.boolean :ocupada,:null => false, :default => false
    end
  end
end
