

use GD1C2018
go



Alter table [no_triggers].ciudad add
constraint fk_id_ciudad_pais foreign key (id_pais) references [no_triggers].pais(id_pais)

Alter table [no_triggers].direccion add constraint fk_id_ciudad_direccion foreign key (id_ciudad) references [no_triggers].ciudad(id_ciudad)

Alter table [no_triggers].rol_por_funcionalidad add
constraint fk_id_rol foreign key (id_rol) references [no_triggers].rol(id_rol),
constraint fk_id_funcionalidad foreign key (id_funcionalidad) references [no_triggers].funcionalidad(id_funcionalidad)

Alter table [no_triggers].hotel add
constraint fk_id_hotel_direccion foreign key (id_direccion) references [no_triggers].direccion(id_direccion)

Alter table [no_triggers].usuario add
constraint fk_id_usuario_rol foreign key (id_rol) references [no_triggers].rol(id_rol),
constraint fk_id_usuario_hotel foreign key (id_hotel) references [no_triggers].hotel(id_hotel),
constraint fk_id_usuario_tipo_documento foreign key (id_tipo_documento) references [no_triggers].tipo_documento(id_tipo_documento)

Alter table [no_triggers].cliente add
constraint fk_id_cliente_direccion foreign key (id_direccion) references [no_triggers].direccion(id_direccion),
constraint fk_id_cliente_pais foreign key (id_pais) references [no_triggers].pais(id_pais),
constraint fk_id_cliente_tipo_doc foreign key (id_tipo_documento) references [no_triggers].tipo_documento(id_tipo_documento)

Alter table [no_triggers].habitacion add
constraint fk_id_habitacion_hotel foreign key (id_hotel) references [no_triggers].hotel(id_hotel),
constraint fk_id_tipo_de_habitacion foreign key (id_tipo_habitacion) references [no_triggers].tipoDeHabitacion(id_tipo_habitacion)

Alter table[no_triggers].reserva add
constraint fk_id_reserva_hotel foreign key (id_hotel) references [no_triggers].hotel(id_hotel),
constraint fk_id_reserva_habitacion foreign key (id_habitacion) references [no_triggers].habitacion(id_habitacion),
constraint fk_id_reserva_en_estado foreign key (id_reserva_estado) references [no_triggers].estado_reserva(id_estado_reserva),
constraint fk_id_reserva_regimen foreign key (id_regimen) references [no_triggers].regimen(id_regimen)

Alter table [no_triggers].estadia add
constraint fk_id_estadia_habitacion foreign key (id_habitacion) references [no_triggers].habitacion(id_habitacion),
constraint fk_id_estadia_reserva foreign key (id_reserva) references [no_triggers].reserva(id_reserva),
constraint fk_id_estadia_cliente foreign key (id_cliente) references [no_triggers].cliente(id_cliente)

Alter table [no_triggers].regimen_por_hotel add
constraint fk_id_regimen foreign key (id_regimen) references [no_triggers].regimen(id_regimen),
constraint fk_id_hotel foreign key (id_hotel) references [no_triggers].hotel(id_hotel)

Alter table [no_triggers].factura add 
constraint fk_id_factura_estadia foreign key (id_estadia) references [no_triggers].estadia(id_estadia),
constraint fk_id_factura_hotel foreign key (id_hotel) references [no_triggers].hotel(id_hotel),
constraint fk_id_factura_cliente foreign key (id_cliente) references [no_triggers].cliente(id_cliente)

Alter table [no_triggers].consumible add
constraint fk_id_consumible_estadia foreign key (id_estadia) references [no_triggers].estadia(id_estadia)

Alter table [no_triggers].item_factura add
constraint fk_id_numero_factura foreign key (id_factura) references [no_triggers].factura(id_factura),
constraint fk_id_item_consumible foreign key (id_consumible) references [no_triggers].consumible(id_consumible)
