
scaffold:
	# Your scaffold here
	rails g scaffold Product \
		name:string{255} \
		description:text \
		category:references;

	rails g scaffold Category \
		name:string{255} \
		description:text;

	rails g scaffold Mesa \
		ocupada:boolean;

	rails g scaffold Estado_pedido \
		nombre:string{50};

	rails g scaffold Tipo_pago \
		nombre:string{50};

	rails g scaffold Pedido \
		fecha:datetime \
		monto_total:integer \
		nuevo:boolean \
		mesa:references \
		estado_pedido:references \
		tipo_pago:references \
		usuario:references;

	rails g scaffold Tipo_usuario \
		nombre:string{50};

	rails g scaffold Usuario \
		nombre:string{50} \
		apellido:string{50} \
		pinpass:string \
		rut:string{11} \
		estado:string{15} \
		tipo_usuario:references;

	rails g scaffold Producto \
		nombre:string{50} \
		tipo:string{10} \
		precio:integer \
		actual:boolean \
		costo:integer;

	rails g scaffold Historial_costo_producto \
		precio:integer \
		fecha:date \
		producto:references;

	rails g scaffold Historial_precio_producto \
		precio:integer \
		fecha:date \
		producto:references;

	rails g scaffold Tipo_material \
		nombre:string{50};

	rails g scaffold Unidad_medida \
		nombre:string{50} \
		simbolo:string{10};

	rails g scaffold Material \
		nombre:string{50} \
		pmp:integer \
		cantidad:integer \
		tipo_material:references \
		unidad_medida:references \
		unidad_medida:references;

	rails g scaffold Receta \
		cantidad_compuesto:integer \
		material:references \
		producto:references;

	rails g scaffold Lote \
		stock_original:integer \
		stock_actual_bodega:integer \
		stock_actual_cocina:integer \
		stock_actual_bar:integer \
		precio_compra:integer \
		material:references \
		unidad_medida:references;

	rails g scaffold Inventario \
		fecha:date \
		hora:time \
		tipo:string{10};

	rails g scaffold Inventario_detalle \
		stcok_local_material:integer \
		material:references \
		inventario:references;

	rails g scaffold Proveedor \
		nombre:string{50} \
		telefono:integer \
		correo:string{100};

	rails g scaffold Tipo_contenedor \
		nombre:string{50};

	rails g scaffold Compra \
		monto_total:integer \
		fecha:datetime \
		monto_iva:integer \
		tipo:string{10} \
		proveedor:references;

	rails g scaffold Detalle_compra \
		cantidad_compra:integer \
		precio_unidad_compra:integer \
		total_compra:integer \
		fecha_vencimiento_lote:date \
		material:references \
		tipo_contenedor:references \
		compra:references;

	rails g scaffold Catalogo_material \
		cantidad_material:integer \
		precio_material:integer \
		material:references \
		unidad_medida:references \
		proveedor:references;

	rails g scaffold Equivalencia \
		cantidad:integer \
		unidad_medida:references \
		tipo_contenedor:references;

	rails g scaffold Detalle_pedido \
		cantidad_venta:integer \
		precio_venta:integer \
		pedido:references \
		nuevo:boolean \
		producto:references;

destroy:
	# Your destroy here
	rails d scaffold Product;
	rails d scaffold Category;
	rails d scaffold Mesa;
	rails d scaffold Estado_pedido;
	rails d scaffold Tipo_pago;
	rails d scaffold Pedido;
	rails d scaffold Tipo_usuario;
	rails d scaffold Usuario;
	rails d scaffold Producto;
	rails d scaffold Historial_costo_producto;
	rails d scaffold Historial_precio_producto;
	rails d scaffold Tipo_material;
	rails d scaffold Unidad_medida;
	rails d scaffold Material;
	rails d scaffold Receta;
	rails d scaffold Lote;
	rails d scaffold Inventario;
	rails d scaffold Inventario_detalle;
	rails d scaffold Proveedor;
	rails d scaffold Tipo_contenedor;
	rails d scaffold Compra;
	rails d scaffold Detalle_compra;
	rails d scaffold Catalogo_material;
	rails d scaffold Equivalencia;
	rails d scaffold Detalle_pedido;

create:
	rake db:drop:all
	rake db:create

migrate:	
	rake db:migrate
	rake db:seed

redoc: destroy scaffold create

redom: migrate 
	rails s
