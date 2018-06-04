use GD1C2018
go

--Tabla Pais
IF OBJECT_ID('[no_triggers].pais', 'U') IS NOT NULL 
  DROP TABLE [no_triggers].pais;

create table [no_triggers].pais
(id_pais int identity(1,1) not null,
pais_nombre nvarchar(40),
pais_nacionalidad nvarchar(80),
constraint pk_id_pais primary key nonclustered (id_pais)
)


--Tabla Ciudad
IF OBJECT_ID('[no_triggers].ciudad', 'U') IS NOT NULL 
  DROP TABLE [no_triggers].ciudad;

create table [no_triggers].ciudad
(id_ciudad int identity(1,1) not null,
id_pais int,
ciudad_nombre nvarchar(80),
constraint pk_id_ciudad primary key nonclustered (id_ciudad),
constraint fk_id_ciudad_pais foreign key (id_pais) references [no_triggers].pais(id_pais)
)


--Tabla Direccion
IF OBJECT_ID('[no_triggers].direccion', 'U') IS NOT NULL 
  DROP TABLE [no_triggers].direccion;

create table [no_triggers].direccion
(id_direccion int identity(1,1) not null, 
direccion_calle nvarchar(200),
direccion_altura int,
direccion_piso int,
direccion_departamento nvarchar(4),
id_ciudad int,
constraint pk_id_direccion primary key nonclustered (id_direccion),
constraint fk_id_ciudad_direccion foreign key (id_ciudad) references [no_triggers].ciudad(id_ciudad)
)

/*
IF OBJECT_ID('[no_triggers].nacionalidad', 'U') IS NOT NULL 
  DROP TABLE [no_triggers].nacionalidad;

create table [no_triggers].nacionalidad
(
id_nacionalidad int identity (1,1) not null,
id_pais int,
nacionalidad_nombre nvarchar(100),
constraint pk_id_nacionalidad primary key nonclustered (id_nacionalidad),
constraint fk_pais_id foreign key (id_pais) references [no_triggers].pais(id_pais)
)
*/

--Funcionalidad
IF OBJECT_ID ('[no_triggers].funcionalidad' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].funcionalidad;
create table [no_triggers].funcionalidad
(
id_funcionalidad int identity (1,1) not null,
funcionalidad_descripcion nvarchar(100),
constraint pk_id_funcionalidad primary key nonclustered (id_funcionalidad)
)
 
--Tabla rol
IF OBJECT_ID ('[no_triggers].rol' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].nacionalidad;

create table [no_triggers].rol
(
id_rol int identity (1,1) not null,
rol_nombre nvarchar(100),
rol_estado bit, --si devuelve 0 es falso, si de vuelve 1 es true--
constraint pk_id_rol primary key nonclustered (id_rol),
)

IF OBJECT_ID ('[no_triggers].rol_x_funcionalidad', 'U') IS NOT NULL
	DROP TABLE [no_triggers].rol_x_funcionalidad

create table [no_triggers].rol_x_funcionalidad
(
id_rol_x_funcionalidad int identity (1,1) not null,
id_rol int,
id_funcionalidad int,
constraint pk_id_rol_x_funcionalidad primary key nonclustered (id_rol_x_funcionalidad),
constraint fk_id_rol foreign key (id_rol) references [no_triggers].rol(id_rol),
constraint fk_id_funcionalidad foreign key (id_funcionalidad) references [no_triggers].funcionalidad(id_funcionalidad)
)

--Tabla hotel
IF OBJECT_ID ('[no_triggers].hotel' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].hotel;

create table [no_triggers].hotel
(
id_hotel int identity (1,1) not null,
id_direccion int,
hotel_cantidad_estrellas float,
hotel_recarga_estrella float,
hotel_fecha_creacion datetime,
constraint pk_id_hotel primary key nonclustered (id_hotel),
constraint fk_id_hotel_direccion foreign key (id_direccion) references [no_triggers].direccion(id_direccion)
)
IF OBJECT_ID ('[no_triggers].tipo_de_documento', 'U') IS NOT NULL
DROP TABLE [NO_TRIGGERS].tipo_de_documento;

create table [no_triggers].tipo_documento
(
id_tipo_documento int identity (1,1) NOT NULL,
tipo_de_documento_nombre nvarchar(30),
constraint id_tipo_de_documento primary key nonclustered (id_tipo_documento)
)
--Tabla Usuario
IF OBJECT_ID ('[no_triggers].usuario' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].usuario;

create table [no_triggers].usuario
(
id_usuario int identity (1,1) not null,
usuario_username nvarchar (100),
usuario_nombre nvarchar(200),
usuario_apellido nvarchar(200),
usuario_password nvarchar (100),
usuario_email nvarchar(200),
usuario_fecha_nacimiento datetime,
id_tipo_documento int,
usuario_numero_documento nvarchar(50),
usuario_telefono nvarchar(50),
usuario_habilitado bit,
ID_rol int,
ID_hotel int,
constraint pk_id_usuario primary key nonclustered (id_usuario),
constraint fk_id_usuario_rol foreign key (id_rol) references [no_triggers].rol(id_rol),
constraint fk_id_usuario_hotel foreign key (id_hotel) references [no_triggers].hotel(id_hotel),
constraint fk_id_usuario_tipo_documento foreign key (id_tipo_documento) references [no_triggers].tipo_documento(id_tipo_documento),
constraint uk_usuario_username unique (usuario_username)
)

--Tabla Cliente
IF OBJECT_ID ('[no_triggers].cliente' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].cliente;
create table [no_triggers].cliente
(
id_cliente int identity (1,1) not null,
cliente_estado bit,
cliente_nombre nvarchar(100),
cliente_apellido nvarchar(200),
cliente_email nvarchar (200),
cliente_fecha_nacimiento datetime,
cliente_tipo_documento nvarchar(10),
cliente_numero_documento nvarchar(50),
cliente_telefono nvarchar (50),
ID_direccion int,
ID_pais int,
constraint pk_id_cliente primary key nonclustered (id_cliente),
constraint fk_id_cliente_direccion foreign key (id_direccion) references [no_triggers].direccion(id_direccion),
constraint fk_id_cliente_pais foreign key (id_pais) references [no_triggers].pais(id_pais),
constraint uk_email_cliente unique (cliente_email)
)

--Tabla Tipo De Habitacion
IF OBJECT_ID ('[no_triggers].tipoDeHabitacion' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].tipoDeHabitacion;
create table [no_triggers].tipoDeHabitacion
(
id_tipo_habitacion int identity (1,1) not null,
tipo_habitacion_descripcion nvarchar(200),
tipo_habitacion_porcentual float,
constraint pk_id_tipo_habitacion primary key nonclustered (id_tipo_habitacion)
)

--Tabla Habitacion
IF OBJECT_ID ('[no_triggers].habitacion' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].habitacion;

create table [no_triggers].habitacion
(
id_habitacion int identity (1,1) not null,
habitacion_numero int,
habitacion_piso int,
habitacion_frente nvarchar(10),
ID_tipo_habitacion int,
ID_hotel int,
constraint pk_id_habitacion primary key nonclustered (id_habitacion),
constraint fk_id_habitacion_hotel foreign key (id_hotel) references [no_triggers].hotel(id_hotel),
constraint fk_id_tipo_de_habitacion foreign key (id_tipo_habitacion) references [no_triggers].tipoDeHabitacion(id_tipo_habitacion)
)

--Tabla estado_reserva
IF OBJECT_ID ('[no_triggers].estado_reserva' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].estado_reserva;

create table [no_triggers].estado_reserva
(
id_estado_reserva int identity (1,1) not null,
estado_reserva_descripcion nvarchar(200),
constraint pk_id_estado_reserva primary key nonclustered (id_estado_reserva)
)

--Tabla Regimen
IF OBJECT_ID ('[no_triggers].regimen' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].regimen;
create table [no_triggers].regimen
(
id_regimen int identity (1,1) not null,
regimen_descripcion nvarchar(200),
regimen_precio float,
regimen_estado bit, --activo o no activo--
constraint pk_id_regimen primary key nonclustered (id_regimen)
)

--Tabla Reserva
IF OBJECT_ID ('[no_triggers].reserva' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].reserva;
create table [no_triggers].reserva
(
id_reserva int identity (1,1) not null,
reserva_fecha_inicio datetime,
reserva_cantidad_noches int,
ID_hotel int,
ID_habitacion int,
ID_reserva_estado int,
ID_regimen int,
constraint pk_id_reserva primary key nonclustered (id_reserva),
constraint fk_id_reserva_hotel foreign key (id_hotel) references [no_triggers].hotel(id_hotel),
constraint fk_id_reserva_habitacion foreign key (id_habitacion) references [no_triggers].habitacion(id_habitacion),
constraint fk_id_reserva_en_estado foreign key (id_reserva_estado) references [no_triggers].estado_reserva(id_estado_reserva),
constraint fk_id_reserva_regimen foreign key (id_regimen) references [no_triggers].regimen(id_regimen)
)

--Tabla Estadia
IF OBJECT_ID ('[no_triggers].estadia' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].estadia;
create table [no_triggers].estadia
(
id_estadia int identity(1,1) not null,
estadia_fecha_inicio datetime,
estadia_cantidad_noches int,
id_habitacion int,
id_reserva int,
id_cliente int,
constraint pk_id_estadia primary key nonclustered (id_estadia),
constraint fk_id_estadia_habitacion foreign key (id_habitacion) references [no_triggers].habitacion(id_habitacion),
constraint fk_id_estadia_reserva foreign key (id_reserva) references [no_triggers].reserva(id_reserva),
constraint fk_id_estadia_cliente foreign key (id_cliente) references [no_triggers].cliente(id_cliente)
)

--tabla regimen x hotel
IF OBJECT_ID ('[no_triggers].regimen_X_hotel' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].regimen_X_hotel;

create table [no_triggers].regimen_X_hotel
(
id_regimen_X_hotel int identity (1,1) not null,
id_regimen int,
id_hotel int,
constraint pk_id_regimen_X_hotel primary key nonclustered (id_regimen_X_hotel),
constraint fk_id_regimen foreign key (id_regimen) references [no_triggers].regimen(id_regimen),
constraint fk_id_hotel foreign key (id_hotel) references [no_triggers].hotel(id_hotel)
)

--Tabla metodo de pago
IF OBJECT_ID ('[no_triggers].metodo_de_pago' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].metodo_de_pago;
create table [no_triggers].metodo_de_pago
(
id_metodo_de_pago int identity (1,1) not null,
metodo_de_pago_nombre nvarchar(20),
metodo_de_pago_detalles nvarchar (300),
constraint pk_id_metodo_pago primary key nonclustered (id_metodo_de_pago)
)

--Tabla facatura
IF OBJECT_ID ('[no_triggers].factura' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].factura;
create table [no_triggers].factura
(
id_factura int identity (1,1) not null,
factura_numero int,
factura_tipo char(1),
factura_fecha datetime,
factura_total float,
id_cliente int,
id_estadia int,
id_hotel int,
constraint pk_id_factura primary key nonclustered (id_factura),
constraint fk_id_factura_estadia foreign key (id_estadia) references [no_triggers].estadia(id_estadia),
constraint fk_id_factura_hotel foreign key (id_hotel) references [no_triggers].hotel(id_hotel),
constraint fk_id_factura_cliente foreign key (id_cliente) references [no_triggers].cliente(id_cliente)
)

--Tabla Consumible
IF OBJECT_ID ('[no_triggers].consumible' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].consumible;
create table [no_triggers].consumible
(
id_consumible int identity (1,1) not null,
consumible_descripcion nvarchar(100),
consumible_precio float,
id_estadia int,
constraint pk_id_consumible primary key nonclustered (id_consumible),
constraint fk_id_consumible_estadia foreign key (id_estadia) references [no_triggers].estadia(id_estadia)
)

--Tabla Item Factura
IF OBJECT_ID ('[no_triggers].item_factura' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].item_factura;
create table [no_triggers].item_factura
(
id_item_factura int identity (1,1) not null,
item_factura_cantidad int,
item_factura_monto float,
id_factura int,
id_consumible int,
constraint pk_id_item_factura primary key nonclustered (id_item_factura),
constraint fk_id_numero_factura foreign key (id_factura) references [no_triggers].factura(id_factura),
constraint fk_id_item_consumible foreign key (id_consumible) references [no_triggers].consumible(id_consumible)
)

--RELACIONES--
