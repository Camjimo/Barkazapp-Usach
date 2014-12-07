class CreateInventarios < ActiveRecord::Migration
  def change
    create_table :inventarios do |t|
      t.datetime :fecha,:null => false
      t.string :tipo, limit: 10,:null => false
      t.boolean :nuevo, :default => true,:null => false
    end
  end
end
