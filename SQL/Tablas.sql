use GD1C2018
go

--------------------------------------------------------------------------------------------------------------------------
/*Creación de tablas */---------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

--tabla auxiliar para saber si la aplicación fue cerrada con éxito
IF OBJECT_ID('[NO_TRIGGERS].tablaControl', 'U') IS NOT NULL 
  DROP TABLE [NO_TRIGGERS].tablaControl;
create table [no_triggers].tablaControl 
( cierre_exitoso int)


--Tabla Pais
IF OBJECT_ID('[NO_TRIGGERS].Pais', 'U') IS NOT NULL 
  DROP TABLE [NO_TRIGGERS].Pais;

CREATE TABLE [NO_TRIGGERS].Pais
(id_pais int identity(1,1) NOT NULL,
pais_nombre nvarchar(40),
pais_nacionalidad nvarchar(80),
CONSTRAINT pk_id_pais PRIMARY KEY CLUSTERED (id_pais asc)
)

--Tabla Ciudad
IF OBJECT_ID('[NO_TRIGGERS].Ciudad', 'U') IS NOT NULL 
  DROP TABLE [NO_TRIGGERS].Ciudad;
CREATE TABLE [NO_TRIGGERS].Ciudad
(
id_ciudad int identity(1,1) NOT NULL,
id_pais int,
ciudad_nombre nvarchar(80),
CONSTRAINT pk_id_ciudad PRIMARY KEY CLUSTERED (id_ciudad asc) 
)

--Tabla Direccion
IF OBJECT_ID('[NO_TRIGGERS].Direccion', 'U') IS NOT NULL 
  DROP TABLE [NO_TRIGGERS].Direccion;
CREATE TABLE [NO_TRIGGERS].Direccion
(id_direccion int identity(1,1) NOT NULL, 
direccion_calle nvarchar(200),
direccion_altura int,
direccion_piso int,
direccion_departamento nvarchar(4),
id_ciudad int,
CONSTRAINT pk_id_direccion PRIMARY KEY CLUSTERED (id_direccion asc)
)

--Funcionalidad
IF OBJECT_ID ('[NO_TRIGGERS].Funcionalidad' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Funcionalidad;
CREATE TABLE [NO_TRIGGERS].Funcionalidad
(
id_funcionalidad int identity (1,1) NOT NULL,
funcionalidad_descripcion nvarchar(100),
CONSTRAINT pk_id_funcionalidad PRIMARY KEY CLUSTERED (id_funcionalidad)
)
 
--Tabla rol
IF OBJECT_ID ('[NO_TRIGGERS].Rol' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Rol;
CREATE TABLE [NO_TRIGGERS].Rol
(
id_rol int identity (1,1) NOT NULL,
rol_nombre nvarchar(100),
rol_estado bit, --si devuelve 0 es falso, si de vuelve 1 es true--
CONSTRAINT pk_id_rol PRIMARY KEY CLUSTERED  (id_rol),
)

-- Tabla Rol por funcionalidad
IF OBJECT_ID ('[NO_TRIGGERS].Rol_por_funcionalidad', 'U') IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Rol_por_funcionalidad
CREATE TABLE [NO_TRIGGERS].Rol_por_funcionalidad
(
id_rol_por_funcionalidad int identity (1,1) NOT NULL,
id_rol int,
id_funcionalidad int,
CONSTRAINT pk_id_rol_por_funcionalidad PRIMARY KEY CLUSTERED (id_rol_por_funcionalidad)
)

--Tabla hotel
IF OBJECT_ID ('[NO_TRIGGERS].Hotel' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Hotel;
CREATE TABLE [NO_TRIGGERS].Hotel
(
id_hotel int identity (1,1) NOT NULL,
id_direccion int,
hotel_nombre nvarchar(100),
hotel_mail nvarchar(200),
hotel_telefono nvarchar(50),
hotel_cantidad_estrellas float,
hotel_recarga_estrella float,
hotel_fecha_creacion datetime,
hotel_estado bit,
CONSTRAINT pk_id_hotel PRIMARY KEY CLUSTERED  (id_hotel)
)

--Talba Tipo Documento
IF OBJECT_ID ('[NO_TRIGGERS].Tipo_documento', 'U') IS NOT NULL
DROP TABLE [NO_TRIGGERS].Tipo_documento;
CREATE TABLE [NO_TRIGGERS].Tipo_documento
(
id_tipo_documento int identity (1,1) NOT NULL,
tipo_de_documento_nombre nvarchar(30),
CONSTRAINT id_tipo_de_documento PRIMARY KEY CLUSTERED (id_tipo_documento)
)

--Tabla Usuario
IF OBJECT_ID ('[NO_TRIGGERS].Usuario' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Usuario;
CREATE TABLE [NO_TRIGGERS].Usuario
(
id_usuario int identity (1,1) NOT NULL,
usuario_username nvarchar (100),
usuario_nombre nvarchar(200),
usuario_apellido nvarchar(200),
usuario_password nvarchar (256),
usuario_email nvarchar(200),
usuario_fecha_nacimiento datetime,
usuario_cantidad_intentos_fallidos int, /*Se decide guardarlo en la BD para que el usuario no pueda cerrar el programa y volver a intentar ingresar*/
usuario_hotel_logueado int,
usuario_last_activity datetime,
id_tipo_documento int,
usuario_numero_documento nvarchar(50),
usuario_telefono nvarchar(50),
usuario_habilitado bit,
id_rol_asignado int, ------------------un usuario puede tener mas de un rol
CONSTRAINT pk_id_usuario PRIMARY KEY CLUSTERED (id_usuario)
)

if OBJECT_ID('[no_triggers].usuario_roles', 'u') is not null drop table [NO_TRIGGERS].usuario_roles

CREATE TABLE [NO_TRIGGERS].usuario_roles
(
id_usuario_roles int identity (1,1) NOT NULL,
id_usuario int,
id_rol int
CONSTRAINT pk_id_usuario_roles PRIMARY KEY CLUSTERED (id_usuario_roles)
)


if OBJECT_ID('[no_triggers].usuario_por_hotel', 'u') is not null drop table [NO_TRIGGERS].usuario_por_hotel

CREATE TABLE [NO_TRIGGERS].usuario_por_hotel
(
id_usuario_por_hotel int identity (1,1) NOT NULL,
id_usuario int,
id_hotel int
CONSTRAINT pk_id_usuario_por_hotel PRIMARY KEY CLUSTERED (id_usuario_por_hotel)
)
--Tabla Cliente
IF OBJECT_ID ('[NO_TRIGGERS].Cliente' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Cliente;
CREATE TABLE [NO_TRIGGERS].Cliente
(
id_cliente int identity (1,1) NOT NULL,
cliente_estado bit,
cliente_nombre nvarchar(100),
cliente_apellido nvarchar(200),
cliente_email nvarchar (200),
cliente_email_invalido bit,-- sirve para indicar los correos que estan duplicados
cliente_fecha_nacimiento datetime,
id_tipo_documento int,
cliente_numero_documento nvarchar(50),
cliente_telefono nvarchar (50),
id_direccion int,
id_pais int,
CONSTRAINT pk_id_cliente PRIMARY KEY CLUSTERED (id_cliente)
)

--Tabla Tipo De Habitacion
IF OBJECT_ID ('[NO_TRIGGERS].TipoDeHabitacion' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].TipoDeHabitacion;
CREATE TABLE [NO_TRIGGERS].TipoDeHabitacion
(
id_tipo_habitacion int identity (1,1) NOT NULL,
tipo_habitacion_porcentual float,
tipo_habitacion_codigo int
CONSTRAINT pk_id_tipo_habitacion PRIMARY KEY CLUSTERED (id_tipo_habitacion)
)

--Tabla Habitacion
IF OBJECT_ID ('[NO_TRIGGERS].Habitacion' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Habitacion;
CREATE TABLE [NO_TRIGGERS].Habitacion
(
id_habitacion int identity (1,1) NOT NULL,
habitacion_numero int,
habitacion_piso int,
habitacion_frente nvarchar(10),
habitacion_habilitada bit, --va a indicar con 0 que esta dada de baja y con 1 que esta habilitada
habitacion_ocupada bit, --va a indicar con 0 que esta ocupada y con 1 que esta desocupada
habitacion_detalle nvarchar(200),
id_tipo_habitacion int,
id_hotel int,
CONSTRAINT pk_id_habitacion PRIMARY KEY CLUSTERED (id_habitacion)
)

--Tabla estado_reserva
IF OBJECT_ID ('[NO_TRIGGERS].Estado_reserva' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Estado_reserva;
CREATE TABLE [NO_TRIGGERS].Estado_reserva
(
id_estado_reserva int identity (1,1) NOT NULL,
estado_reserva_descripcion nvarchar(200),
CONSTRAINT pk_id_estado_reserva PRIMARY KEY CLUSTERED (id_estado_reserva)
)

--Tabla Regimen
IF OBJECT_ID ('[NO_TRIGGERS].Regimen' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Regimen;
CREATE TABLE [NO_TRIGGERS].Regimen
(
id_regimen int identity (1,1) NOT NULL,
regimen_descripcion nvarchar(200),
regimen_precio float,
regimen_estado bit, --activo o no activo--
CONSTRAINT pk_id_regimen PRIMARY KEY CLUSTERED (id_regimen)
)

--Tabla Reserva
IF OBJECT_ID ('[NO_TRIGGERS].Reserva' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Reserva;
CREATE TABLE [NO_TRIGGERS].Reserva
(
id_reserva int identity (1,1) NOT NULL,
reserva_fecha_inicio datetime,
reserva_cantidad_noches int,
reserva_numero_codigo int,
id_reserva_cambiada_por_user int,
id_hotel int,
id_habitacion int,
id_reserva_estado int,
id_regimen int,
CONSTRAINT pk_id_reserva PRIMARY KEY CLUSTERED (id_reserva)
)

--Tabla Estadia
IF OBJECT_ID ('[NO_TRIGGERS].Estadia' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Estadia;
CREATE TABLE  [NO_TRIGGERS].Estadia
(
id_estadia int identity(1,1) NOT NULL,
estadia_fecha_inicio datetime,
estadia_cantidad_noches int,
id_habitacion int,
id_reserva int,
id_cliente int,
CONSTRAINT pk_id_estadia PRIMARY KEY CLUSTERED (id_estadia)
)

--tabla regimen x hotel
IF OBJECT_ID ('[NO_TRIGGERS].Regimen_por_hotel' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Regimen_por_hotel;
CREATE TABLE [NO_TRIGGERS].Regimen_por_hotel
(
id_regimen_por_hotel int identity (1,1) NOT NULL,
id_regimen int,
id_hotel int,
CONSTRAINT pk_id_regimen_por_hotel PRIMARY KEY CLUSTERED (id_regimen_por_hotel),
)

--tabla consumibles x estadia
IF OBJECT_ID ('[NO_TRIGGERS].Consumible_por_estadia' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Consumible_por_estadia;
CREATE TABLE [NO_TRIGGERS].Consumible_por_estadia
(
id_consumible_por_estadia int identity (1,1) NOT NULL,
id_consumible int,
id_estadia int,
CONSTRAINT pk_id_cosumible_por_estadia PRIMARY KEY CLUSTERED (id_consumible_por_estadia),
)

--Tabla metodo de pago
IF OBJECT_ID ('[NO_TRIGGERS].Metodo_de_pago' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Metodo_de_pago;
CREATE TABLE [NO_TRIGGERS].Metodo_de_pago
(
id_metodo_de_pago int identity (1,1) NOT NULL,
metodo_de_pago_nombre nvarchar(20),
metodo_de_pago_detalles nvarchar (300),
CONSTRAINT pk_id_metodo_pago PRIMARY KEY CLUSTERED (id_metodo_de_pago)
)

--Tabla factura
IF OBJECT_ID ('[NO_TRIGGERS].Factura' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Factura;
CREATE TABLE [NO_TRIGGERS].Factura
(
id_factura int identity (1,1) NOT NULL,
factura_numero int,
factura_tipo char(1),
factura_fecha datetime,
factura_total float,
id_cliente int,
id_estadia int,
id_hotel int,
id_metodo_pago int,
CONSTRAINT pk_id_factura PRIMARY KEY CLUSTERED (id_factura)
)

--Tabla Consumible
IF OBJECT_ID ('[NO_TRIGGERS].Consumible' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Consumible;
CREATE TABLE [NO_TRIGGERS].Consumible
(
id_consumible int identity (1,1) NOT NULL,
consumible_descripcion nvarchar(100),
consumible_precio float,
consumible_codigo int,
CONSTRAINT pk_id_consumible PRIMARY KEY CLUSTERED (id_consumible)
)

--Tabla Item Factura
IF OBJECT_ID ('[NO_TRIGGERS].Item_factura' , 'U' ) IS NOT NULL
	DROP TABLE [NO_TRIGGERS].Item_factura;
CREATE TABLE [NO_TRIGGERS].Item_factura
(
id_item_factura int identity (1,1) NOT NULL,
item_factura_cantidad int,
item_factura_monto float,
id_factura int,
id_consumible int,
CONSTRAINT pk_id_item_factura PRIMARY KEY CLUSTERED (id_item_factura)
)

--Tabla Baja_de_hotel
IF OBJECT_ID ('[NO_TRIGGERS].Baja_de_hotel','U') IS NOT NULL
DROP TABLE [NO_TRIGGERS].Baja_de_hotel;
CREATE TABLE [NO_TRIGGERS].Baja_de_hotel
(
id_baja_de_hotel int identity (1,1) NOT NULL,
baja_hotel_fecha_inicio datetime,
baja_hotel_fecha_fin datetime,
baja_de_hotel_motivo nvarchar(300),
id_hotel int,
CONSTRAINT pk_baja_de_hotel PRIMARY KEY CLUSTERED (id_baja_de_hotel)
)
