use GD1C2018
go

--Tabla Pais
IF OBJECT_ID('[no_triggers].pais', 'U') IS NOT NULL 
  DROP TABLE [no_triggers].pais;
create table [no_triggers].pais
(id_pais int identity(1,1) not null,
pais_nombre nvarchar(40),
pais_nacionalidad nvarchar(80),
constraint pk_id_pais primary key clustered (id_pais asc)
)

--Tabla Ciudad
IF OBJECT_ID('[no_triggers].ciudad', 'U') IS NOT NULL 
  DROP TABLE [no_triggers].ciudad;
create table [no_triggers].ciudad
(id_ciudad int identity(1,1) not null,
id_pais int,
ciudad_nombre nvarchar(80),
constraint pk_id_ciudad primary key clustered (id_ciudad asc) 
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
constraint pk_id_direccion primary key clustered (id_direccion asc)
)

--Funcionalidad
IF OBJECT_ID ('[no_triggers].funcionalidad' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].funcionalidad;
create table [no_triggers].funcionalidad
(
id_funcionalidad int identity (1,1) not null,
funcionalidad_descripcion nvarchar(100),
constraint pk_id_funcionalidad primary key clustered (id_funcionalidad)
)
 
--Tabla rol
IF OBJECT_ID ('[no_triggers].rol' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].rol;
create table [no_triggers].rol
(
id_rol int identity (1,1) not null,
rol_nombre nvarchar(100),
rol_estado bit, --si devuelve 0 es falso, si de vuelve 1 es true--
constraint pk_id_rol primary key clustered (id_rol),
)

-- Tabla Rol por funcionalidad
IF OBJECT_ID ('[no_triggers].rol_por_funcionalidad', 'U') IS NOT NULL
	DROP TABLE [no_triggers].rol_por_funcionalidad
create table [no_triggers].rol_por_funcionalidad
(
id_rol_por_funcionalidad int identity (1,1) not null,
id_rol int,
id_funcionalidad int,
constraint pk_id_rol_por_funcionalidad primary key clustered (id_rol_por_funcionalidad)
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
constraint pk_id_hotel primary key clustered (id_hotel)
)

--Talba Tipo Documento
IF OBJECT_ID ('[no_triggers].tipo_de_documento', 'U') IS NOT NULL
DROP TABLE [NO_TRIGGERS].tipo_de_documento;
create table [no_triggers].tipo_documento
(
id_tipo_documento int identity (1,1) NOT NULL,
tipo_de_documento_nombre nvarchar(30),
constraint id_tipo_de_documento primary key clustered (id_tipo_documento)
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
constraint pk_id_usuario primary key clustered (id_usuario),
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
cliente_email_invalido bit,-- sirve para indicar los correos que estan duplicados
cliente_fecha_nacimiento datetime,
id_tipo_documento int,
cliente_numero_documento nvarchar(50),
cliente_telefono nvarchar (50),
ID_direccion int,
ID_pais int,
constraint pk_id_cliente primary key clustered (id_cliente)
--constraint uk_email_cliente unique (cliente_email)
)

--Tabla Tipo De Habitacion
IF OBJECT_ID ('[no_triggers].tipoDeHabitacion' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].tipoDeHabitacion;
create table [no_triggers].tipoDeHabitacion
(
id_tipo_habitacion int identity (1,1) not null,
tipo_habitacion_descripcion nvarchar(200),
tipo_habitacion_porcentual float,
tipo_habitacion_codigo int
constraint pk_id_tipo_habitacion primary key clustered (id_tipo_habitacion)
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
Id_tipo_habitacion int,
Id_hotel int,
constraint pk_id_habitacion primary key clustered (id_habitacion)
)

--Tabla estado_reserva
IF OBJECT_ID ('[no_triggers].estado_reserva' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].estado_reserva;
create table [no_triggers].estado_reserva
(
id_estado_reserva int identity (1,1) not null,
estado_reserva_descripcion nvarchar(200),
constraint pk_id_estado_reserva primary key clustered (id_estado_reserva)
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
constraint pk_id_regimen primary key clustered (id_regimen)
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
constraint pk_id_reserva primary key clustered (id_reserva)
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
constraint pk_id_estadia primary key clustered (id_estadia)
)

--tabla regimen x hotel
IF OBJECT_ID ('[no_triggers].regimen_por_hotel' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].regimen_por_hotel;
create table [no_triggers].regimen_por_hotel
(
id_regimen_por_hotel int identity (1,1) not null,
id_regimen int,
id_hotel int,
constraint pk_id_regimen_por_hotel primary key clustered (id_regimen_por_hotel),
)

--Tabla metodo de pago
IF OBJECT_ID ('[no_triggers].metodo_de_pago' , 'U' ) IS NOT NULL
	DROP TABLE [no_triggers].metodo_de_pago;
create table [no_triggers].metodo_de_pago
(
id_metodo_de_pago int identity (1,1) not null,
metodo_de_pago_nombre nvarchar(20),
metodo_de_pago_detalles nvarchar (300),
constraint pk_id_metodo_pago primary key clustered (id_metodo_de_pago)
)

--Tabla factura
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
constraint pk_id_factura primary key clustered (id_factura)
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
constraint pk_id_consumible primary key clustered (id_consumible)
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
constraint pk_id_item_factura primary key clustered (id_item_factura)
)

-------------------------------- Migracion --------------------------------------------------------------------------

--PAIS
INSERT INTO [NO_TRIGGERS].[pais] ([pais_nombre],pais_nacionalidad) values
	('Argentina','ARGENTINO'),('Brasil','BRASILERO'),('Uruguay','URUGUAYO'),('Indefinido','Indefinido');
--select * from [no_triggers].pais

--CIUDAD
insert into [no_triggers].ciudad (id_pais,ciudad_nombre)
select distinct 
(select id_pais from [NO_TRIGGERS].pais where pais_nombre='Argentina'),
Hotel_Ciudad from gd_esquema.Maestra
insert into [no_triggers].ciudad (id_pais,ciudad_nombre)
select id_pais, 'Indefinida' as ciudad_nombre from [NO_TRIGGERS].pais where pais_nombre='Indefinido'
--select * from [no_triggers].ciudad

--Direccion
insert into [NO_TRIGGERS].direccion (direccion_calle,direccion_altura,direccion_piso,direccion_departamento, id_ciudad)
select distinct hotel_calle, hotel_nro_calle, null, null, cd.id_ciudad from gd_esquema.Maestra mr 
join [NO_TRIGGERS].ciudad cd on mr.Hotel_Ciudad=cd.ciudad_nombre
union
select distinct 
cliente_dom_calle, Cliente_Nro_Calle, Cliente_Piso, Cliente_Depto,  (select id_ciudad from [NO_TRIGGERS].ciudad where ciudad_nombre='Indefinida')
from gd_esquema.Maestra
--select * from [no_triggers].direccion

-- Hotel 

insert into [NO_TRIGGERS].hotel(id_direccion,hotel_cantidad_estrellas,hotel_recarga_estrella,hotel_fecha_creacion)
select distinct dr.id_direccion, mr.Hotel_CantEstrella,mr.Hotel_Recarga_Estrella, getdate() from gd_esquema.Maestra mr
join [NO_TRIGGERS].ciudad cd on mr.Hotel_Ciudad=cd.ciudad_nombre
join [NO_TRIGGERS].direccion dr on mr.Hotel_Calle=dr.direccion_calle and cd.id_ciudad=dr.id_ciudad and mr.Hotel_Nro_Calle=dr.direccion_altura

--select * from [no_triggers].hotel

-- Tipo de documento

insert into [NO_TRIGGERS].tipo_documento (tipo_de_documento_nombre) values 
('D.N.I.'),('L.E.'),('C.I.'),('Pasaporte')

--select * from [no_triggers].tipo_documento


insert into [NO_TRIGGERS].funcionalidad
values
	('ABM ROL'),--1
	('ABM USUARIO'),--2
	('ABM CLIENTE'),--3
	('ABM HOTEL'),--4
	('ABM HABITACION'),--5
	('ABM REGIMEN DE ESTADIA'),--6
	('GENERAR/MODIFICAR RESERVA'),--7
	('CANCELAR RESERVA'),--8
	('REGISTRAR ESTADIA/CHECK-IN CHECK-OUT'),--9
	('REGISTRAR CONSUMIBLE'),--10
	('FACTURAR ESTADIA'),--11
	('LISTADO ESTADISTICO'),--12
	('LOGIN y SEGURIDAD')--13
go

insert into [NO_TRIGGERS].rol
values 
    ('RECEPCIONISTA', 1),--1
    ('GUEST', 1),--2
    ('ADMINISTRADOR', 1)--3

go

insert into [NO_TRIGGERS].rol_por_funcionalidad
values
	(3,1),
	(3,2),
	(1,3),
	(3,4),
	(3,5),
	(3,6),
	(1,7),
	(2,7),
	(1,8),
	(2,8),
	(1,9),
	(1,10), --verificar recepcion
	(1,11),
	(3,12),
	(1,13),
	(3,13)
go

insert into [NO_TRIGGERS].estado_reserva
values
	('RESERVA CORRECTA'),
	('RESERVA MODIFICADA'),
	('RESERVA CANCELADA POR RECEPCION'),
	('RESERVA CANCELADA POR CLIENTE'),
	('RESERVA CANCELADA POR NO-SHOW'),
	('RESERVA EFECTIVIZADA')
go

insert into [NO_TRIGGERS].metodo_de_pago
values 
	('TARJETA DE CREDITO','PAGO EN CUOTAS'),
	('TARJETA DE DEBITO','EN ARS'),
	('TARJETA DE CREDITO','UNICO PAGO EN ARS'),
	('TARJETA DE DEBITO','EN USD'),
	('EFECTIVO','EN ARS'),
	('EFECTIVO', 'EN USD')
go

-- clientes 
declare @ciudad_indef int 
select @ciudad_indef=id_ciudad from [NO_TRIGGERS].ciudad where ciudad_nombre='Indefinida'
insert into [NO_TRIGGERS].cliente
(cliente_estado
,cliente_nombre
,cliente_apellido
,cliente_email
,cliente_fecha_nacimiento
,id_tipo_documento
,cliente_numero_documento
,cliente_telefono
,ID_direccion
,ID_pais)
select distinct 1 as cliente_estado,
Cliente_Nombre, Cliente_Apellido
,Cliente_Mail,Cliente_Fecha_Nac
,(select id_tipo_documento from [NO_TRIGGERS].tipo_documento where tipo_de_documento_nombre='Pasaporte')
,Cliente_Pasaporte_Nro
,null as cliente_telefono
,dr.id_direccion
,ps.id_pais
from gd_esquema.Maestra mr
join [NO_TRIGGERS].direccion dr on mr.Cliente_Dom_Calle=dr.direccion_calle and mr.Cliente_Nro_Calle=dr.direccion_altura and mr.Cliente_Depto=dr.direccion_departamento
and mr.Cliente_Piso=dr.direccion_piso and dr.id_ciudad=@ciudad_indef
join [NO_TRIGGERS].pais ps on mr.Cliente_Nacionalidad=ps.pais_nacionalidad
--identifico mails invalidos
select cliente_email into #bad_emails from [NO_TRIGGERS].cliente
group by cliente_email
having count(1)>1
update cl 
set cliente_email_invalido=1
from [NO_TRIGGERS].cliente cl 
join #bad_emails be on cl.cliente_email=be.cliente_email
drop table #bad_emails

--select * from [NO_TRIGGERS].cliente

--Tipo Habitacion
insert into [NO_TRIGGERS].tipoDeHabitacion
select distinct 
	Habitacion_Tipo_Descripcion,
	Habitacion_Tipo_Porcentual,
	Habitacion_Tipo_Codigo
from gd_esquema.Maestra
--select * from [NO_TRIGGERS].tipoDeHabitacion

--Habitacion
insert into [NO_TRIGGERS].habitacion
select distinct 
	Habitacion_Numero,
	Habitacion_Piso,
	Habitacion_Frente,
	(select top 1 id_tipo_habitacion from [NO_TRIGGERS].tipoDeHabitacion
	where tipo_habitacion_descripcion = Habitacion_Tipo_Descripcion and tipo_habitacion_codigo = Habitacion_Tipo_Codigo and tipo_habitacion_porcentual = Habitacion_Tipo_Porcentual),
	(select top 1 h.id_hotel from [NO_TRIGGERS].hotel H
	join [NO_TRIGGERS].direccion D on D.id_direccion = H.id_direccion 
	where D.direccion_calle = Hotel_Calle and D.direccion_altura = m.Hotel_Nro_Calle)
from gd_esquema.Maestra m

/*select * from [NO_TRIGGERS].habitacion hab
join [NO_TRIGGERS].hotel H on hab.ID_hotel = H.id_hotel
join [NO_TRIGGERS].direccion D on D.id_direccion = h.id_direccion*/

-- Relaciones

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