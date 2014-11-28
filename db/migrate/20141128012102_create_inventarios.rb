class CreateInventarios < ActiveRecord::Migration
  def change
    create_table :inventarios do |t|
      t.date :fecha
      t.time :hora
      t.string :tipo, limit: 10
    end
  end
end
