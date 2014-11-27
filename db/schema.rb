# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141127221425) do

  create_table "catalogo_materials", force: true do |t|
    t.integer  "cantidad_material"
    t.integer  "precio_material"
    t.integer  "material_id"
    t.integer  "unidad_medida_id"
    t.integer  "proveedor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "catalogo_materials", ["material_id"], name: "index_catalogo_materials_on_material_id", using: :btree
  add_index "catalogo_materials", ["proveedor_id"], name: "index_catalogo_materials_on_proveedor_id", using: :btree
  add_index "catalogo_materials", ["unidad_medida_id"], name: "index_catalogo_materials_on_unidad_medida_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compras", force: true do |t|
    t.integer  "monto_total"
    t.datetime "fecha"
    t.integer  "monto_iva"
    t.string   "tipo",         limit: 10
    t.integer  "proveedor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "compras", ["proveedor_id"], name: "index_compras_on_proveedor_id", using: :btree

  create_table "detalle_compras", force: true do |t|
    t.integer  "cantidad_compra"
    t.integer  "precio_unidad_compra"
    t.integer  "total_compra"
    t.date     "fecha_vencimiento_lote"
    t.integer  "material_id"
    t.integer  "tipo_contenedor_id"
    t.integer  "compra_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detalle_compras", ["compra_id"], name: "index_detalle_compras_on_compra_id", using: :btree
  add_index "detalle_compras", ["material_id"], name: "index_detalle_compras_on_material_id", using: :btree
  add_index "detalle_compras", ["tipo_contenedor_id"], name: "index_detalle_compras_on_tipo_contenedor_id", using: :btree

  create_table "equivalencia", force: true do |t|
    t.integer  "cantidad"
    t.integer  "unidad_medida_id"
    t.integer  "tipo_contenedor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "equivalencia", ["tipo_contenedor_id"], name: "index_equivalencia_on_tipo_contenedor_id", using: :btree
  add_index "equivalencia", ["unidad_medida_id"], name: "index_equivalencia_on_unidad_medida_id", using: :btree

  create_table "estado_pedidos", force: true do |t|
    t.string   "nombre",     limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historial_costo_productos", force: true do |t|
    t.integer  "precio"
    t.date     "fecha"
    t.integer  "producto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historial_costo_productos", ["producto_id"], name: "index_historial_costo_productos_on_producto_id", using: :btree

  create_table "historial_precio_productos", force: true do |t|
    t.integer  "precio"
    t.date     "fecha"
    t.integer  "producto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historial_precio_productos", ["producto_id"], name: "index_historial_precio_productos_on_producto_id", using: :btree

  create_table "inventario_detalles", force: true do |t|
    t.integer  "stcok_local_material"
    t.integer  "material_id"
    t.integer  "inventario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventario_detalles", ["inventario_id"], name: "index_inventario_detalles_on_inventario_id", using: :btree
  add_index "inventario_detalles", ["material_id"], name: "index_inventario_detalles_on_material_id", using: :btree

  create_table "inventarios", force: true do |t|
    t.date     "fecha"
    t.time     "hora"
    t.string   "tipo",       limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lotes", force: true do |t|
    t.integer  "stock_original"
    t.integer  "stock_actual_bodega"
    t.integer  "stock_actual_cocina"
    t.integer  "stock_actual_bar"
    t.integer  "precio_compra"
    t.integer  "material_id"
    t.integer  "unidad_medida_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lotes", ["material_id"], name: "index_lotes_on_material_id", using: :btree
  add_index "lotes", ["unidad_medida_id"], name: "index_lotes_on_unidad_medida_id", using: :btree

  create_table "materials", force: true do |t|
    t.string   "nombre",           limit: 50
    t.integer  "pmp"
    t.integer  "cantidad"
    t.integer  "tipo_material_id"
    t.integer  "unidad_medida_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["tipo_material_id"], name: "index_materials_on_tipo_material_id", using: :btree
  add_index "materials", ["unidad_medida_id"], name: "index_materials_on_unidad_medida_id", using: :btree

  create_table "mesas", force: true do |t|
    t.boolean  "ocupada"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedidos", force: true do |t|
    t.datetime "fecha"
    t.integer  "monto_total"
    t.integer  "mesa_id"
    t.integer  "estado_pedido_id"
    t.integer  "tipo_pago_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pedidos", ["estado_pedido_id"], name: "index_pedidos_on_estado_pedido_id", using: :btree
  add_index "pedidos", ["mesa_id"], name: "index_pedidos_on_mesa_id", using: :btree
  add_index "pedidos", ["tipo_pago_id"], name: "index_pedidos_on_tipo_pago_id", using: :btree
  add_index "pedidos", ["usuario_id"], name: "index_pedidos_on_usuario_id", using: :btree

  create_table "productos", force: true do |t|
    t.string   "nombre",     limit: 50
    t.string   "tipo",       limit: 10
    t.integer  "precio"
    t.boolean  "actual"
    t.integer  "costo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "proveedors", force: true do |t|
    t.string   "nombre",     limit: 50
    t.integer  "telefono"
    t.string   "correo",     limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receta", force: true do |t|
    t.integer  "cantidad_compuesto"
    t.integer  "material_id"
    t.integer  "producto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receta", ["material_id"], name: "index_receta_on_material_id", using: :btree
  add_index "receta", ["producto_id"], name: "index_receta_on_producto_id", using: :btree

  create_table "tipo_contenedors", force: true do |t|
    t.string   "nombre",     limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_materials", force: true do |t|
    t.string   "nombre",     limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_pagos", force: true do |t|
    t.string   "nombre",     limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_usuarios", force: true do |t|
    t.string   "nombre",     limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unidad_medidas", force: true do |t|
    t.string   "nombre",     limit: 50
    t.string   "simbolo",    limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "address"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usuarios", force: true do |t|
    t.string   "nombre",          limit: 50
    t.string   "apellido",        limit: 50
    t.string   "pinpass"
    t.string   "rut",             limit: 11
    t.string   "estado",          limit: 15
    t.integer  "tipo_usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["tipo_usuario_id"], name: "index_usuarios_on_tipo_usuario_id", using: :btree

end
