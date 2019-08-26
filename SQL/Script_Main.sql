USE [GD2C2018]
GO
---- ESQUEMA
if not exists(SELECT * FROM sys.schemas WHERE name = 'elgalego')
begin
Exec('CREATE SCHEMA [elgalego] AUTHORIZATION [gdEspectaculos2018]')
end
GO
----- TABLAS

-----------------------------METADATA
--MedioPago
IF OBJECT_ID('[elgalego].MedioPago', 'U') IS NOT NULL   DROP TABLE [elgalego].MedioPago;
CREATE TABLE elgalego.MedioPago
(
ID_MedioPago int identity(1,1) unique not null,
Descripcion nvarchar(20),
MarcaBorrado int,
CONSTRAINT PK_ID_MedioPago PRIMARY KEY CLUSTERED (ID_MedioPago asc)
)

--tipodocumento
IF OBJECT_ID('[elgalego].TipoDocumento', 'U') IS NOT NULL   DROP TABLE [elgalego].TipoDocumento;
create table elgalego.TipoDocumento
(ID_TipoDoc int identity(1,1) unique not null,
TipoDocumento nvarchar(30) not null,
MarcaBorrado int,
CONSTRAINT PK_ID_TipoDocumento PRIMARY KEY CLUSTERED (ID_TipoDoc asc)
)

--tipoTarjeta
IF OBJECT_ID('[elgalego].TipoTarjeta', 'U') IS NOT NULL   DROP TABLE [elgalego].TipoTarjeta;
create table elgalego.TipoTarjeta
(ID_TipoTarj int identity(1,1) unique not null,
TipoTarjeta nvarchar(30) not null,
MarcaBorrado int,
CONSTRAINT PK_ID_TipoTarjeta PRIMARY KEY CLUSTERED (ID_TipoTarj asc)
)

--Estado
IF OBJECT_ID('[elgalego].Estado', 'U') IS NOT NULL   DROP TABLE [elgalego].Estado;
create table elgalego.Estado
(ID_Estado int identity(1,1) unique not null,
Estado nvarchar(30) not null,
MarcaBorrado int,
CONSTRAINT PK_ID_Estado PRIMARY KEY CLUSTERED (ID_Estado asc)
)

--RUBRO
IF OBJECT_ID('[elgalego].Rubro', 'U') IS NOT NULL   DROP TABLE [elgalego].Rubro;
CREATE TABLE elgalego.Rubro
(
ID_Rubro int identity(1,1) unique not null,
RubroNombre nvarchar(30),
RubroDescr nvarchar(50),
MarcaBorrado int,
CONSTRAINT PK_ID_Rubro PRIMARY KEY CLUSTERED (ID_Rubro asc)
)
--GRADO
IF OBJECT_ID('[elgalego].Grado', 'U') IS NOT NULL   DROP TABLE [elgalego].Grado;
CREATE TABLE elgalego.Grado
(
ID_Grado int identity(1,1) unique not null,
GradoNombre nvarchar(30),
Comision decimal (5,2), -- porcentaje comision
MarcaBorrado int,
CONSTRAINT PK_ID_Grado PRIMARY KEY CLUSTERED (ID_Grado asc)
)
--TIPOUBICACION
IF OBJECT_ID('[elgalego].TipoUbicacion', 'U') IS NOT NULL   DROP TABLE [elgalego].TipoUbicacion;
CREATE TABLE elgalego.TipoUbicacion
(
ID_TipoUbicacion int identity(1,1) unique not null,
Nombre nvarchar(30),
Codigo nvarchar(30),
MarcaBorrado int,
CONSTRAINT PK_ID_TipoUbicacion PRIMARY KEY CLUSTERED (ID_TipoUbicacion asc)
)
--PREMIO
IF OBJECT_ID('[elgalego].Premio', 'U') IS NOT NULL   DROP TABLE [elgalego].Premio;
CREATE TABLE elgalego.Premio
(
ID_Premio int identity(1,1) unique not null,
ValorPuntos int,
Descripcion nvarchar(50),
Stock int,
MarcaBorrado int,
CONSTRAINT PK_ID_Premio PRIMARY KEY CLUSTERED (ID_Premio asc)
)
--ROL
IF OBJECT_ID('[elgalego].Rol', 'U') IS NOT NULL   DROP TABLE [elgalego].Rol;
CREATE TABLE elgalego.Rol
(
ID_Rol int identity(1,1) unique not null,
RolNombre nvarchar(30),
MarcaBorrado int,
CONSTRAINT PK_ID_Rol PRIMARY KEY CLUSTERED (ID_Rol asc)
)
--FUNCIONALIDAD
IF OBJECT_ID('[elgalego].Funcionalidad', 'U') IS NOT NULL   DROP TABLE [elgalego].Funcionalidad;
CREATE TABLE elgalego.Funcionalidad
(
ID_Funcionalidad int identity(1,1) unique not null,
FuncionalidadNombre nvarchar(30),
MarcaBorrado int,
CONSTRAINT PK_ID_Funcionalidad PRIMARY KEY CLUSTERED (ID_Funcionalidad asc)
)
--ROLFUNCIONALIDAD
IF OBJECT_ID('[elgalego].RolFuncionalidad', 'U') IS NOT NULL   DROP TABLE [elgalego].RolFuncionalidad;
CREATE TABLE elgalego.RolFuncionalidad
(
ID_RolFuncionalidad int identity(1,1) unique not null,
ID_Rol int,
ID_Funcionalidad int,
CONSTRAINT PK_ID_RolFuncionalidad PRIMARY KEY CLUSTERED (ID_RolFuncionalidad asc)
)

--USUARIO
IF OBJECT_ID('[elgalego].Usuario', 'U') IS NOT NULL   DROP TABLE [elgalego].Usuario;
CREATE TABLE elgalego.Usuario
(
ID_Usuario int identity(1,1) unique not null,
Username nvarchar(30),
UserPass nvarchar(256),
UltimoLogin datetime,
ID_RolSel int,
IntentosLogin int, 
MarcaBorrado int,
CONSTRAINT PK_ID_Usuario PRIMARY KEY NONCLUSTERED (ID_Usuario asc)
)
--UsuarioRol
IF OBJECT_ID('[elgalego].UsuarioRol', 'U') IS NOT NULL   DROP TABLE [elgalego].UsuarioRol;
CREATE TABLE elgalego.UsuarioRol
(
ID_UsuarioRol int identity(1,1) unique not null,
ID_Rol int,
ID_Usuario int,
CONSTRAINT PK_ID_UsuarioRol PRIMARY KEY CLUSTERED (ID_UsuarioRol asc)
)

--TARJETA
IF OBJECT_ID('[elgalego].Tarjeta', 'U') IS NOT NULL   DROP TABLE [elgalego].Tarjeta;
CREATE TABLE elgalego.Tarjeta
(
ID_Tarjeta int identity(1,1) unique not null,
Nombre nvarchar(30),
Apellido nvarchar(50),
ID_TipoTarj int, 
NroTarjeta bigint,
FechaVenc date,
MarcaBorrado int,
CONSTRAINT PK_ID_Tarjeta PRIMARY KEY NONCLUSTERED (ID_Tarjeta asc)
)
--DOMICILIO
IF OBJECT_ID('[elgalego].Domicilio', 'U') IS NOT NULL   DROP TABLE [elgalego].Domicilio;
CREATE TABLE elgalego.Domicilio
(
ID_Domicilio int identity(1,1) unique not null,
Calle nvarchar(50),
NroDomi int,
NroDpto nvarchar(5),
NroPiso int,
Ciudad nvarchar(50),
CodPostal nvarchar(10),
MarcaBorrado int,
CONSTRAINT PK_ID_Domicilio PRIMARY KEY NONCLUSTERED (ID_Domicilio asc)
)
--EMPRESA
IF OBJECT_ID('[elgalego].Empresa', 'U') IS NOT NULL   DROP TABLE [elgalego].Empresa;
CREATE TABLE elgalego.Empresa
(
ID_Empresa int identity(1,1) unique not null,
ID_Usuario int not null,
ID_Domicilio int not null, 
RazonSocial nvarchar(80),
Mail nvarchar(80),
Telefono nvarchar(15),
CUIT nvarchar(50),
FechaCreacion date,
MarcaBorrado int,
CONSTRAINT PK_ID_Empresa PRIMARY KEY NONCLUSTERED (ID_Empresa asc)
)
--CLIENTE
IF OBJECT_ID('[elgalego].Cliente', 'U') IS NOT NULL   DROP TABLE [elgalego].Cliente;
CREATE TABLE elgalego.Cliente
(
ID_Cliente int identity(1,1) unique not null,
ID_Usuario int not null,
ID_Tarjeta int  null,
ID_Domicilio int not null,
Nombre nvarchar(60),
Apellido nvarchar(80),
ID_TipoDoc int,
NroDoc nvarchar(10),
CUIL nvarchar(13),
Mail nvarchar(100),
Telefono nvarchar(15),
FechaNac date,
FechaCreacion datetime,
MarcaBorrado int,
CONSTRAINT PK_ID_Cliente PRIMARY KEY NONCLUSTERED (ID_Cliente asc)
)
--PUBLICACION
IF OBJECT_ID('[elgalego].Publicacion', 'U') IS NOT NULL   DROP TABLE [elgalego].Publicacion;
CREATE TABLE elgalego.Publicacion
(
ID_Publicacion int identity(1,1) unique not null,
ID_Rubro int not null,
ID_Domicilio int not null,
ID_Grado int not null,
ID_Empresa int not null,
ID_Estado int not null,
Titulo nvarchar(60),
Descripcion nvarchar(150),
FechaPublicado datetime,
FechaEvento datetime,
Codigo nvarchar(50),
MarcaBorrado int,
CONSTRAINT PK_ID_Publicacion PRIMARY KEY NONCLUSTERED (ID_Publicacion asc)
)
--COMPRA
IF OBJECT_ID('[elgalego].Compra', 'U') IS NOT NULL   DROP TABLE [elgalego].Compra;
CREATE TABLE elgalego.Compra
(
ID_Compra int identity(1,1) unique not null,
ID_Cliente int not null,
ID_Ubicacion int not null,
ID_Tarjeta int  null,
FechaCompra datetime,
PrecioCompra money,
Cantidad int,
PuntosAcumulados int,
MarcaBorrado int,
CONSTRAINT PK_ID_Compra PRIMARY KEY NONCLUSTERED (ID_Compra asc)
)
--CANJE
IF OBJECT_ID('[elgalego].Canje', 'U') IS NOT NULL   DROP TABLE [elgalego].Canje;
CREATE TABLE elgalego.Canje
(
ID_Canje int identity(1,1) unique not null,
ID_Cliente int not null,
ID_Premio int not null,
FechaCanje datetime,
ValorPuntos int,
MarcaBorrado int,
CONSTRAINT PK_ID_Canje PRIMARY KEY NONCLUSTERED (ID_Canje asc)
)

--UBICACION

IF OBJECT_ID('[elgalego].Ubicacion', 'U') IS NOT NULL   DROP TABLE [elgalego].Ubicacion;
CREATE TABLE elgalego.Ubicacion
(
ID_Ubicacion int identity(1,1) unique not null,
ID_Publicacion int not null,
ID_TipoUbicacion int not null,
Vendida int,
Fila nvarchar(3),
Asiento int,
SinNumerar int,
MarcaBorrado int,
Precio money
CONSTRAINT PK_ID_Ubicacion PRIMARY KEY CLUSTERED (ID_Ubicacion asc)
)
--FACTURA
IF OBJECT_ID('[elgalego].Factura', 'U') IS NOT NULL   DROP TABLE [elgalego].Factura;
CREATE TABLE elgalego.Factura
(
ID_Factura int identity(1,1) unique not null,
ID_Empresa int not null,
FacturaNumero bigint,
FacturaTipo nvarchar(20),
FacturaFecha datetime,
Monto money,
ID_MedioPago nvarchar (25),
MarcaAnulacion int,
MarcaBorrado int,
CONSTRAINT PK_ID_Factura PRIMARY KEY CLUSTERED (ID_Factura asc)
)

--ITEMFACTURA
IF OBJECT_ID('[elgalego].ItemFactura', 'U') IS NOT NULL   DROP TABLE [elgalego].ItemFactura;
CREATE TABLE elgalego.ItemFactura
(
ID_ItemFactura int identity(1,1) unique not null,
ID_Compra int not null,
ID_Factura int not null,
Importe money,
Cantidad int,
Descripcion nvarchar(100),
MarcaBorrado int,
CONSTRAINT PK_ID_ItemFactura PRIMARY KEY CLUSTERED (ID_ItemFactura asc)
)

------------------------------------------- Funciones y SP necesarios para Login
IF OBJECT_ID ('[elgalego].fn_encriptar') IS NOT NULL drop function [elgalego].fn_encriptar
go

create function elgalego.fn_encriptar (@pass nvarchar(256))
returns nvarchar(255)
as begin
    return(SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('SHA2_256', @pass)), 3, 255))
end
GO

IF OBJECT_ID ('[elgalego].sp_creaUser') IS NOT NULL drop procedure [elgalego].sp_creaUser
go
create procedure elgalego.sp_creaUser(@user nvarchar(30), @passwd nvarchar(30))
as
begin
if not exists (select * from elgalego.Usuario where Username=@user)
	begin
	insert into elgalego.Usuario (Username,UserPass) values (@user, elgalego.fn_encriptar(@passwd))
	end
end
go
-----------------------------------------------------------------------------------------------------------
--- MIGRACION


--- METADATOS

if exists(select 1 from elgalego.tipoDocumento) truncate table elgalego.tipoDocumento
insert into elgalego.tipoDocumento (TipoDocumento) values ('DNI'),('Pasaporte')

if exists (select 1 from elgalego.Estado) truncate table elgalego.Estado
insert into elgalego.Estado (Estado)
select distinct Espectaculo_Estado from gd_esquema.Maestra
insert into elgalego.Estado (estado) values ('Borrador'),('Pausada'),('Finalizada')

if exists (select 1 from elgalego.MedioPago) truncate table elgalego.MedioPago
insert into elgalego.MedioPago (Descripcion)
select distinct
    [Forma_Pago_Desc]--MedioPago.Descripcion
  FROM [gd_esquema].[Maestra] where Forma_Pago_Desc is not null
insert into elgalego.MedioPago (Descripcion) values ('Tarjeta de Credito'),('Tajeta de debito')

if exists  (select 1 from elgalego.TipoUbicacion) truncate table elgalego.tipoUbicacion
insert into elgalego.TipoUbicacion (Codigo, Nombre)
select distinct
      [Ubicacion_Tipo_Codigo]--TipoUbicacion.Codigo
      ,[Ubicacion_Tipo_Descripcion]--TipoUbicacion.Nombre
	  from gd_esquema.Maestra

if exists  (select 1 from elgalego.Rubro) truncate table elgalego.Rubro
insert into elgalego.Rubro (RubroNombre)
	  select distinct
      [Espectaculo_Rubro_Descripcion] --Rubro.RubroNombre
	  from gd_esquema.Maestra
insert into elgalego.Rubro (RubroNombre) values ('Comedia'),('Recital'),('Musical'),('Avant Premiere')

if exists  (select 1 from elgalego.Grado) truncate table elgalego.Grado
insert into elgalego.Grado (GradoNombre,Comision) values
('Exposicion Alta', 11.5), ('Exposicion Media',7.25), ('Exposicion Baja',4.2)

if exists  (select 1 from elgalego.Premio) truncate table elgalego.Premio
insert into elgalego.Premio (Descripcion,Stock,ValorPuntos) values ('Peluche',100,500), ('Combo Gaseosa', 200, 250)

if exists  (select 1 from elgalego.TipoTarjeta) truncate table elgalego.TipoTarjeta
insert into elgalego.TipoTarjeta (TipoTarjeta) values ('Credito'), ('Debito')

--- SEGURIDAD

if exists(select 1 from elgalego.funcionalidad) truncate table elgalego.funcionalidad
insert into elgalego.Funcionalidad (FuncionalidadNombre) values
('Rol'),('Clientes'),('Empresa'),('Rubro'),('Grado'),('Publicacion'),('Compra'),('Historial'),('Canje'),('Rendicion'),('Listado'),('Usuario')

if exists(select 1 from elgalego.rol) truncate table elgalego.rol
Insert into elgalego.Rol (RolNombre,MarcaBorrado) values ('Empresa',0),('Administrativo',0),('Cliente',0)


if exists(select 1 from elgalego.rolFuncionalidad) truncate table elgalego.rolFuncionalidad
if object_id('tempdb..#rolfun') is not null drop table #rolfun
create table #rolfun (rol nvarchar(30), funcionalidad nvarchar(30))
insert into #rolfun values ('Empresa','Grado'),('Empresa','Publicacion'),('Cliente','Compra'),('Cliente','Historial'),('Cliente','Canje')
,('Administrativo','Rol'),('Administrativo','Clientes'),('Administrativo','Empresa'),('Administrativo','Rubro'),('Administrativo','Rendicion'),('Administrativo','Listado')
,('Administrativo','Usuario')--,('Administrativo','Publicacion'),('Administrativo','Compra'),('Administrativo','Historial'),('Administrativo','Canje')
insert into elgalego.rolfuncionalidad (ID_Rol,ID_Funcionalidad)
select id_rol, id_funcionalidad from #rolfun v join elgalego.rol r on v.rol=r.RolNombre join elgalego.Funcionalidad  f on v.funcionalidad=f.FuncionalidadNombre
if object_id('tempdb..#rolfun') is not null drop table #rolfun

if exists(select 1 from elgalego.Usuario) truncate table elgalego.usuario
insert into elgalego.Usuario(Username,UserPass) values ('Admin',elgalego.fn_encriptar('w23e'))
go

set nocount on
go
if object_id('tempdb..#users') is not null drop table #users
create table #users (username nvarchar(80), tipoUser nvarchar(60))
insert into #users
select distinct espec_empresa_razon_social username, 'Empresa' tipoUser from gd_esquema.Maestra
go
insert into #users
select distinct
      convert(nvarchar(20),[Cli_Dni]) username, 'Cliente' tipoUser--Cliente.NroDoc
	  from gd_esquema.Maestra
where Cli_Dni is not null

declare @username nvarchar(80)
declare em_Cur cursor for
select username from #users
open em_Cur
fetch next from em_Cur into @username
while @@FETCH_STATUS=0
begin
	exec elgalego.sp_creaUser @username, 'default'
	fetch next from em_Cur into @username
end
close em_Cur
deallocate em_Cur

if exists(select 1 from elgalego.UsuarioRol) truncate table elgalego.UsuarioRol
insert into #users values ('Admin', 'Empresa'), ('Admin', 'Administrativo'),('Admin', 'Cliente')
insert into elgalego.UsuarioRol (ID_Usuario,ID_Rol)
select id_usuario, id_rol from #users v join elgalego.usuario u on v.username=u.username join elgalego.Rol r on v.tipoUSer=r.RolNombre
if object_id('tempdb..#users') is not null drop table #users

go
set nocount off
go

--- DIMENSIONALES

if exists (select 1 from elgalego.Domicilio) truncate table elgalego.Domicilio
insert into elgalego.Domicilio (calle, NroDomi, NroPiso, NroDpto, CodPostal)
SELECT distinct
	  [Espec_Empresa_Dom_Calle] --Domicilio.Calle
      ,[Espec_Empresa_Nro_Calle] --Domicilio.NroDomi
      ,[Espec_Empresa_Piso] --Domicilio.NroPiso
      ,[Espec_Empresa_Depto] --Domicilio.NroDpto
      ,[Espec_Empresa_Cod_Postal] --Domicilio.CodPostal
	  FROM [gd_esquema].[Maestra]
union
Select distinct 
	   [Cli_Dom_Calle]--Domicilio.Calle
      ,[Cli_Nro_Calle]--Domicilio.NroDomi
      ,[Cli_Piso]--Domicilio.Piso
      ,[Cli_Depto]--Domicilio.Depto
      ,[Cli_Cod_Postal]--Domicilio.CodPostal
FROM [gd_esquema].[Maestra]
where Cli_Dom_Calle is not null
union
Select 'Desconocido' as Calle, 1 as nrodomi, null as piso, null as dpto, 1 as codPostal

--select * from elgalego.Domicilio

if exists(select 1 from elgalego.Empresa) truncate table elgalego.empresa
insert into elgalego.Empresa (id_usuario, RazonSocial, CUIT, FechaCreacion, Mail, ID_Domicilio) -- no existe telefono en el modelo
select distinct 
		u.id_usuario
	   ,[Espec_Empresa_Razon_Social] --Empresa.RazonSocial
      ,[Espec_Empresa_Cuit] -- Empresa.CUIT
      ,[Espec_Empresa_Fecha_Creacion] --Empresa.FechaCreacion
      ,[Espec_Empresa_Mail] --Empresa.Mail
	  , dm.ID_Domicilio
	  
	  from gd_esquema.Maestra mr
	  join elgalego.Domicilio dm on mr.Espec_Empresa_Dom_Calle=dm.Calle 
		and mr.Espec_Empresa_Cod_Postal=dm.CodPostal 
		and mr.Espec_Empresa_Nro_Calle=dm.NroDomi 
		and mr.Espec_Empresa_Piso=dm.NroPiso
		and mr.Espec_Empresa_Depto=dm.NroDpto
	  join elgalego.Usuario u on mr.Espec_Empresa_Razon_Social=u.Username

declare @domiDesconocido int 
select @domiDesconocido=id_domicilio from elgalego.Domicilio where Calle='Desconocido'

if exists(select 1 from elgalego.cliente) truncate table elgalego.cliente
insert into elgalego.Cliente (ID_Usuario,ID_Domicilio,ID_TipoDoc,NroDoc,Apellido,Nombre,FechaNac,Mail, FechaCreacion) --- no habia cuil ni telefono.
select distinct
 u.ID_Usuario, isnull(d.ID_Domicilio,@domiDesconocido)
 ,1
 ,convert(nvarchar(20),Cli_Dni),Cli_Apeliido,Cli_Nombre,Cli_Fecha_Nac,Cli_Mail, getdate() as fechacreacion
from gd_esquema.Maestra mr
left join elgalego.Domicilio d on mr.Cli_Cod_Postal=d.CodPostal and mr.Cli_Dom_Calle=d.Calle and mr.Cli_Nro_Calle=d.NroDomi and mr.Cli_Piso=d.NroPiso and mr.Cli_Depto=d.NroDpto
left join elgalego.Usuario u on convert(nvarchar(20),mr.Cli_Dni)=u.Username
where u.ID_Usuario is not null

go

update u
set
u.ID_RolSel=r.ID_Rol
from elgalego.usuario u 
join elgalego.empresa e on u.id_usuario=e.id_usuario
join elgalego.rol r on r.rolNombre='Empresa'

update u
set
u.ID_RolSel=r.ID_Rol
from elgalego.usuario u 
join elgalego.cliente e on u.id_usuario=e.id_usuario
join elgalego.rol r on r.rolNombre='Cliente'

update u 
set ID_RolSel=r.ID_Rol
from elgalego.usuario u 
join elgalego.rol r on r.rolNombre='Administrativo' and u.Username='Admin'

go

---- Tablas FACTICAS	
if exists(select 1 from elgalego.Publicacion) truncate table elgalego.Publicacion
insert into elgalego.Publicacion (ID_Rubro,ID_Domicilio,ID_Grado,ID_Empresa,ID_Estado,Codigo,Titulo,FechaPublicado,FechaEvento)
SELECT distinct
	  rr.ID_Rubro
	  ,do.ID_Domicilio
	  ,gg.ID_Grado
	  ,ee.ID_Empresa
	  ,es.ID_Estado
      ,[Espectaculo_Cod] --Publicacion.Codigo
      ,[Espectaculo_Descripcion] --Publicacion.Titulo
      ,[Espectaculo_Fecha] --Publicacion.FechaPublicado
      ,[Espectaculo_Fecha_Venc] --Publicacion.FechaEvento
from gd_esquema.Maestra mm
join elgalego.Domicilio do on do.Calle='Desconocido'
left join elgalego.Rubro rr on mm.Espectaculo_Rubro_Descripcion=rr.RubroNombre --- un left join cambia el query plan y lo hace mas performante.
join elgalego.Grado gg on gg.GradoNombre='Exposicion Media'
join elgalego.Empresa ee on mm.Espec_Empresa_Cuit=ee.CUIT
join elgalego.Estado es on mm.Espectaculo_Estado=es.Estado


if exists(select 1 from elgalego.Ubicacion) truncate table elgalego.Ubicacion
insert into elgalego.Ubicacion(ID_Publicacion, ID_TipoUbicacion, Fila, Asiento, SinNumerar,Precio)
SELECT distinct
      pp.ID_Publicacion
	  ,tp.ID_TipoUbicacion
	  ,[Ubicacion_Fila]--Ubicacion.Fila
      ,[Ubicacion_Asiento]--Ubicacion.Asiento
      ,[Ubicacion_Sin_numerar]--Ubicacion.SinNumerar
	  ,Ubicacion_Precio
FROM [gd_esquema].[Maestra] mm
join  elgalego.Publicacion pp on mm.Espectaculo_Cod=pp.Codigo
join elgalego.TipoUbicacion tp on mm.Ubicacion_Tipo_Codigo=tp.Codigo


if exists(select 1 from elgalego.Compra) truncate table elgalego.Compra
insert into elgalego.Compra (ID_Cliente, ID_Ubicacion, FechaCompra, PrecioCompra, Cantidad)
SELECT distinct
	   cc.ID_Cliente
	  ,ub.ID_Ubicacion
      ,[Compra_Fecha]--Compras.FechaCompra
	  ,ub.Precio
      ,[Compra_Cantidad]--Compras.Cantidad
FROM [gd_esquema].[Maestra] mm
join elgalego.cliente cc on convert(nvarchar(20),mm.Cli_Dni)=cc.NroDoc
join elgalego.Publicacion pp on mm.Espectaculo_Cod=pp.Codigo
join elgalego.TipoUbicacion tp on mm.Ubicacion_Tipo_Codigo=tp.Codigo
join elgalego.Ubicacion ub on pp.id_publicacion=ub.ID_Publicacion and tp.ID_TipoUbicacion=ub.ID_TipoUbicacion and mm.Ubicacion_Fila=ub.Fila and mm.Ubicacion_Asiento=ub.Asiento


if exists(select 1 from elgalego.Factura) truncate table elgalego.Factura
insert into elgalego.Factura (ID_Empresa,ID_MedioPago,FacturaNumero,FacturaTipo,FacturaFecha,Monto)
SELECT distinct
	  ee.ID_Empresa
	  ,mp.ID_MedioPago
	  ,[Factura_Nro]--Facturas.FacturaNumero
	  ,'Desconocido' as FacturaTipo
      ,[Factura_Fecha]--Facturas.FacturaFecha
      ,[Factura_Total]--Facturas.Monto
FROM [gd_esquema].[Maestra] mm
join elgalego.Empresa ee on mm.Espec_Empresa_Cuit=ee.CUIT
join elgalego.MedioPago mp on mm.Forma_Pago_Desc=mp.Descripcion

if exists(select 1 from elgalego.ItemFactura) truncate table elgalego.ItemFactura
insert into elgalego.ItemFactura (ID_Compra,ID_Factura, Importe, Cantidad, Descripcion)
SELECT distinct
	   co.ID_Compra
	   ,ff.ID_Factura       
      ,[Item_Factura_Monto]--ItemFactura.Importe
      ,[Item_Factura_Cantidad]--ItemFactura.Cantidad
      ,[Item_Factura_Descripcion]--ItemFactura.Descripcion
      
  FROM [gd_esquema].[Maestra] mm
  join elgalego.Factura ff on mm.Factura_Nro=ff.FacturaNumero
join elgalego.cliente cc on convert(nvarchar(20),mm.Cli_Dni)=cc.NroDoc
join elgalego.Publicacion pp on mm.Espectaculo_Cod=pp.Codigo
join elgalego.TipoUbicacion tp on mm.Ubicacion_Tipo_Codigo=tp.Codigo
join elgalego.Ubicacion ub on pp.id_publicacion=ub.ID_Publicacion and tp.ID_TipoUbicacion=ub.ID_TipoUbicacion and mm.Ubicacion_Fila=ub.Fila and mm.Ubicacion_Asiento=ub.Asiento
join elgalego.Compra co on co.ID_Cliente=cc.ID_Cliente and co.ID_Ubicacion=ub.ID_Ubicacion   
-- select count(1) from elgalego.compra
go  

--------------------------------- Stored procedures principales


--- procedure buscar
if object_id('elgalego.spBuscar') is not null drop procedure elgalego.spBuscar
go
create procedure elgalego.spBuscar
(
@nombreTabla nvarchar(50)
, @nombreColum1 nvarchar(50)
, @valorBuscado1 nvarchar(250)=null
, @nombreColum2 nvarchar(50)=null
, @valorBuscado2 nvarchar(250)=null
, @nombreColum3 nvarchar(50)
, @valorBuscado3 nvarchar(250)=null
, @nombreColum4 nvarchar(50)
, @valorBuscado4 nvarchar(250)=null
, @nombreColum5 nvarchar(50)
, @valorBuscado5 nvarchar(250)=null
, @nombreColum6 nvarchar(50)
, @valorBuscado6 nvarchar(250)=null
)
as
begin

declare @query nvarchar(max)

if @valorBuscado1 is not null
set @query='Select * from ' + @nombreTabla + ' where (' + @nombreColum1 + ' like ''%'+@valorbuscado1+'%'' )'
else
set @query='Select * from ' + @nombreTabla + ' where 1=1 '
if @nombreColum2 is not null and @valorBuscado2 is not null			
	set @query=@query+' and (' + @nombreColum2 + ' like ''%'+@valorbuscado2+'%'' )'
if @nombreColum3 is not null and @valorBuscado3 is not null			
	set @query=@query+' and (' + @nombreColum3 + ' like ''%'+@valorbuscado3+'%'' )' 
if @nombreColum4 is not null and @valorBuscado4 is not null			
	set @query=@query+' and (' + @nombreColum4 + ' like ''%'+@valorbuscado4+'%'' )' 
if @nombreColum5 is not null and @valorBuscado5 is not null			
	set @query=@query+' and (' + @nombreColum5 + ' like ''%'+@valorbuscado5+'%'' )' 
if @nombreColum6 is not null and @valorBuscado6 is not null			
	set @query=@query+' and (' + @nombreColum6 + ' like ''%'+@valorbuscado6+'%'' )' 


execute sp_executesql @query

end
go
--- Nota importante, el tipo de campos se va a definir una vez tenga armado el ABM
--elgalego.spBuscar 'elgalego.cliente', 'nombre',null,'apellido',null,'mail','gmail',null,null,null,null,null,null


----------------------- GET generico
if object_id('elgalego.spgetvaltabla') is not null drop procedure elgalego.spgetvaltabla
go
create procedure elgalego.spgetValTabla 
(@nombreTabla nvarchar(50), @nombreColID nvarchar(50), @nombreColBus nvarchar(50), @valorBuscado nvarchar(250))
as
begin
declare @query nvarchar(max), @result nvarchar(100)

set @query=N'Select @result='+ @nombreColBus +' from ' + @nombreTabla + ' where ' + @nombreColID + ' = '+ @valorbuscado 
--select @query
execute sp_executesql @query, N'@result NVARCHAR(100) output', @result=@result output

select @result

end
go



-- elgalego.spgetvaltabla 'elgalego.usuario', 'id_usuario', 'username', '1'

--- SET Generico
if object_id('elgalego.spsetvaltabla') is not null drop procedure elgalego.spsetvaltabla
go
create procedure elgalego.spsetValTabla 
(@nombreTabla nvarchar(50), @nombreColID nvarchar(50), @valorID nvarchar(10),  @nombreColupd nvarchar(50), @nuevoValor nvarchar(250))
as
begin
declare @query nvarchar(max)
set @query='update '+ @nombreTabla +' set ' + @nombreColupd + '= ' + @nuevoValor + ' where '+@nombreColID+'= ' +  @valorID

execute sp_executesql @query

end
go

if object_id('elgalego.spBorrar') is not null drop procedure elgalego.spBorrar
go
create procedure elgalego.spBorrar 
(@nombreTabla nvarchar(50), @nombreColID nvarchar(50), @valorID nvarchar(10))
as
begin
declare @query nvarchar(max)
set @query='update '+ @nombreTabla +' set MarcaBorrado = 1 where '+@nombreColID+'= ' +  @valorID

execute sp_executesql @query

end
go

---- Select generico
if object_id('elgalego.spSelectTabla') is not null drop procedure elgalego.spSelectTabla
go
create procedure elgalego.spSelectTabla (@nombreTabla nvarchar(50))
as
begin
declare @query nvarchar(max)
set @query= 'select * from ' + @nombreTabla
exec sp_executesql @query
end

go
if object_id('elgalego.spSelTablaFiltrada') is not null drop procedure elgalego.spSelTablaFiltrada
go
create procedure elgalego.spSelTablaFiltrada (@nombreTabla nvarchar(50), @nomCampoFiltro nvarchar(50), @ValorFiltro nvarchar(250))
as
begin
declare @query nvarchar(max)
set @query= 'select * from ' + @nombreTabla + ' where ' +@nomCampoFiltro +' = ' + @ValorFiltro
exec sp_executesql @query
end

go

if object_id('elgalego.spExisteValor') is not null drop procedure elgalego.spExisteValor
go

create procedure elgalego.spExisteValor (@nombreTabla nvarchar(50), @nomCampoFiltro nvarchar(50), @ValorFiltro nvarchar(250))
as
begin
declare @query nvarchar(max), @counts int

set @query= 'select @cnt=count(1) from ' + @nombreTabla + ' where convert(nvarchar(max),' +@nomCampoFiltro +') = ''' + @ValorFiltro+''''
exec sp_executesql @query, N'@cnt int output', @cnt=@counts output

if @counts=0 return 0 else return 1

end
-- elgalego.spExisteValor 'elgalego.empresa', 'razonsocial', 'asa'
go

if object_id('elgalego.spExisteOtroValor') is not null drop procedure elgalego.spExisteOtroValor
go

create procedure elgalego.spExisteOtroValor (@nombreTabla nvarchar(50), @nomCampoFiltro nvarchar(50), @ValorFiltro nvarchar(250),@campoID nvarchar(50),@ID_Actual nvarchar(10))
as
begin
declare @query nvarchar(max), @counts int

set @query= 'select @cnt=count(1) from ' + @nombreTabla + ' where convert(nvarchar(max),' +@nomCampoFiltro +') = ''' + @ValorFiltro+''''
set @query=@query + ' and ' + @campoID + ' != ' + @ID_Actual
exec sp_executesql @query, N'@cnt int output', @cnt=@counts output

if @counts=0 return 0 else return 1
--print convert(nvarchar(10),@counts)
end
-- elgalego.spExisteOtroValor 'elgalego.empresa', 'razonsocial', 'master','ID_empresa','1'
go




----------------------- LOGIN
-- exec elgalego.sp_incrementar_intentos_fallidos 'UsuarioAdministrador2';
IF OBJECT_ID ('elgalego.spLoginFailed','P') IS NOT NULL drop procedure elgalego.spLoginFailed
go

create procedure elgalego.spLoginFailed (@usuario nvarchar(100))
as

if((select isnull(IntentosLogin,0) from elgalego.Usuario where @usuario= username ) <2)
	begin
	update elgalego.Usuario
set IntentosLogin =  isnull(IntentosLogin+1,1) where  @usuario=username
	end
else
	begin	
	update elgalego.Usuario
	set IntentosLogin =  IntentosLogin+1,  MarcaBorrado = 1 where  @usuario=username
end

go

IF OBJECT_ID ('elgalego.spResetLoginCounter','P') IS NOT NULL drop procedure elgalego.spResetLoginCounter
go
create procedure elgalego.spResetLoginCounter (@usuario nvarchar(100))
as
update elgalego.Usuario
set IntentosLogin =  0
where username = @usuario
go



IF OBJECT_ID ('elgalego.fnUserEnabled') IS NOT NULL drop function elgalego.fnUserEnabled
go

create function elgalego.fnUserEnabled (@usuario nvarchar(100))
returns int
as
begin
declare @result int
select @result=case when isnull(MarcaBorrado,0)=0 then 1 else 0 end from elgalego.Usuario where username=@usuario;
return @result

end

go
 -- select elgalego.fnuserenabled ('admin')

IF OBJECT_ID ('elgalego.spLogin') IS NOT NULL drop procedure elgalego.spLogin
go
create procedure elgalego.spLogin (@usuario nvarchar(100), @password nvarchar(256))

as begin
declare @resultado int, @password2 nvarchar(256)
set @password2 = elgalego.fn_encriptar(@password)
if (((SELECT UserPass FROM elgalego.Usuario WHERE username=@usuario) = @password2) and ((select isnull(IntentosLogin,0) from elgalego.Usuario where username = @usuario)<=3)) and ((select isnull(MarcaBorrado,0) from elgalego.Usuario where username=@usuario)=0)
	begin	
		exec elgalego.spResetLoginCounter @usuario
		set @resultado = 1
	end
ELSE
	begin
		exec elgalego.spLoginFailed @usuario
		set @resultado=0
	end
return @resultado
END
GO


-- elgalego.splogin 'admin','w23e'
IF OBJECT_ID ('elgalego.fnUserRoleEnabled') IS NOT NULL drop function elgalego.fnUserRoleEnabled
go

create function elgalego.fnUserRoleEnabled
(@usern nvarchar(100)) returns int
	AS 
		begin
	declare @Resultado int
	if exists 
	(select uh.id_rol from elgalego.UsuarioRol uh 
	join elgalego.rol rl on uh.id_rol=rl.id_rol
	join elgalego.Usuario u on uh.id_usuario=u.id_usuario
	where u.username=@usern and isnull(rl.MarcaBorrado,0)=0
	)
	begin
	select @Resultado=1
	end else select @resultado=0
	return @resultado
end
GO

IF OBJECT_ID ('elgalego.fnABMHabilitado') IS NOT NULL drop function elgalego.fnABMHabilitado
go

create function elgalego.fnABMHabilitado 
(@user nvarchar(100), @funcionalidad nvarchar (100)) returns bit
	AS
		begin
			declare @Resultado bit
		if exists (select fr.id_funcionalidad from elgalego.RolFuncionalidad fr 
				
				
				join elgalego.Usuario us on us.ID_RolSel=fr.ID_Rol
				join elgalego.Funcionalidad f on fr.id_funcionalidad=f.id_funcionalidad
				JOIN elgalego.Rol  RL ON fr.ID_Rol=RL.id_rol
				where f.FuncionalidadNombre=@Funcionalidad and us.username=@user
				AND isnull(RL.MarcaBorrado,0)=0)
			set @Resultado=1
		else
			set @Resultado=0
	return @resultado
end
GO

--select elgalego.fnABMHabilitado('razon social nº:5','listado')

IF OBJECT_ID ('elgalego.fnMultirole') IS NOT NULL drop function elgalego.fnMultirole
go

-- select elgalego.fnMultirole('admin')
create function elgalego.fnMultirole (@usuario nvarchar(100))
returns int
as
begin
declare @result int, @count int

select @count=count(1) from elgalego.UsuarioRol uh 
join elgalego.Usuario us on uh.id_usuario=us.id_usuario
join elgalego.Rol r on uh.id_rol=r.id_rol
where us.username=@usuario and r.MarcaBorrado=0

if (@count >1)  begin select @result=1 end else begin select @result=0 end

return @result

end

go


IF OBJECT_ID ('elgalego.fnIsAdmin') IS NOT NULL drop function elgalego.fnIsAdmin
go

-- select elgalego.fn_chequear_usuario_si_multihotel('user_guest1')
create function elgalego.fnIsAdmin (@usuario nvarchar(100))
returns int
as
begin
declare @result int, @count int
if exists (select 1 from elgalego.UsuarioRol uh 
join elgalego.Usuario us on uh.id_usuario=us.id_usuario
join elgalego.Rol r on uh.id_rol=r.id_rol
where us.username=@usuario and r.MarcaBorrado=0 and RolNombre='Administrativo' )  begin select @result=1 end else begin select @result=0 end

return @result

end

go






IF OBJECT_ID ('elgalego.setRolSelected') IS NOT NULL drop procedure elgalego.setRolSelected
go
create procedure elgalego.setRolSelected (@usuario nvarchar(100),@rol int)

as 
begin
update Usuario
set ID_RolSel=@rol
where Username=@usuario
end
go
---- rol

IF OBJECT_ID ('elgalego.spRolListado','P') IS NOT NULL drop procedure elgalego.spRolListado 
go
create procedure elgalego.spRolListado 

	AS
select 
rl.id_rol [ID], rolnombre [Rol Nombre],case when isnull(rl.MarcaBorrado,0)=0 then 1 else 0 end as [Rol Activo]
,isnull(STUFF((SELECT ',' + FuncionalidadNombre
              from elgalego.Funcionalidad f2, elgalego.RolFuncionalidad rf2
              WHERE f2.id_funcionalidad = rf2.id_funcionalidad and rf.id_rol=rf2.id_rol order by FuncionalidadNombre
              FOR XML PATH (''))
             , 1, 1, ''),'') as [Lista Funcionalidades]
from elgalego.Rol rl 
left join elgalego.Rolfuncionalidad rf on rl.id_rol=rf.id_rol
left join elgalego.Funcionalidad f on rf.id_funcionalidad=f.id_funcionalidad

group by rl.id_rol,rf.id_rol, rolnombre, case when isnull(rl.MarcaBorrado,0)=0 then 1 else 0 end
GO


IF OBJECT_ID ('elgalego.sp_lista_fun_act','P') IS NOT NULL drop procedure elgalego.sp_lista_fun_act 
go
create procedure elgalego.sp_lista_fun_act (@id_rol int) 

	AS
select 
f.id_funcionalidad,f.FuncionalidadNombre
from elgalego.rolFuncionalidad rf 
join elgalego.Funcionalidad f on rf.id_funcionalidad=f.id_funcionalidad
where rf.id_rol=@id_rol and isnull(f.MarcaBorrado,0)=0
	GO

IF OBJECT_ID ('elgalego.sp_lista_fun_disp','P') IS NOT NULL drop procedure elgalego.sp_lista_fun_disp
go
create procedure elgalego.sp_lista_fun_disp (@id_rol int) 

	AS
select 
f.id_funcionalidad,f.FuncionalidadNombre
from elgalego.Funcionalidad f 
where f.id_funcionalidad not in (select id_funcionalidad from elgalego.rolFuncionalidad rff where rff.id_rol=@id_rol)
and isnull(f.MarcaBorrado,0)=0
--and FuncionalidadNombre != 'USUARIO'-- REMOVIDO USUARIO DADO QUE NO DEBE SER ASIGNADO A NINGUN ROL
	GO

IF OBJECT_ID ('elgalego.fn_get_rol_nombre') IS NOT NULL drop function elgalego.fn_get_rol_nombre
go

create function elgalego.fn_get_rol_nombre
(@id int) returns nvarchar(100)
	AS 
		begin
	declare @Resultado nvarchar(100)
	select @Resultado=rolnombre from elgalego.Rol where id_rol=@id
	return @resultado
end
GO

IF OBJECT_ID ('elgalego.fn_get_rol_estado') IS NOT NULL drop function elgalego.fn_get_rol_estado
go

create function elgalego.fn_get_rol_estado
(@id int) returns int
	AS 
		begin
	declare @Resultado int
	select @Resultado=case when MarcaBorrado=0 then 1 else 0 end from elgalego.Rol where id_rol=@id
	return @resultado
end
GO

IF OBJECT_ID ('elgalego.fn_next_id_rol') IS NOT NULL drop function elgalego.fn_next_id_rol
go

create function elgalego.fn_next_id_rol () returns int
	AS 
		begin
	declare @Resultado int
	select @Resultado=max(id_rol) from elgalego.Rol
	return @resultado
end
GO

IF OBJECT_ID ('elgalego.fn_nombre_rol_unico') IS NOT NULL drop function elgalego.fn_nombre_rol_unico
go

create function elgalego.fn_nombre_rol_unico (@nombre nvarchar (100)) returns int
	AS 
		begin
	declare @Resultado int
	if exists (select 1 from elgalego.rol where rolnombre=@nombre) begin

	select @Resultado=0
	end else select @Resultado=1
	return @resultado
end
GO

IF OBJECT_ID ('elgalego.fn_nombre_rol_unico_upd') IS NOT NULL drop function elgalego.fn_nombre_rol_unico_upd
go

create function elgalego.fn_nombre_rol_unico_upd (@nombre nvarchar (100), @idrol int) returns int
	AS 
		begin
	declare @Resultado int
	if exists (select 1 from elgalego.rol where rolnombre=@nombre and id_rol <> @idrol) begin
	select @Resultado=0
	end else select @Resultado=1
	return @resultado
end
GO

IF OBJECT_ID ('elgalego.sp_set_rol_nombre','P') IS NOT NULL drop procedure elgalego.sp_set_rol_nombre
go
create procedure elgalego.sp_set_rol_nombre 
@id int, @Nombre_rol varchar (100)
	AS
		update elgalego.Rol
		set rolnombre=@Nombre_rol
		where id_rol=@id
	GO

IF OBJECT_ID ('elgalego.sp_set_rol_estado','P') IS NOT NULL drop procedure elgalego.sp_set_rol_estado 
go
create procedure elgalego.sp_set_rol_estado
@id_rol int, @estado_modificado int
	AS
	update elgalego.rol set MarcaBorrado=case when @estado_modificado=1 then 0 else 1 end
	WHERE @id_rol=id_rol
	GO
--exec elgalego.sp_rol_set_estado 1,1
GO

IF OBJECT_ID ('elgalego.sp_rol_crear','P') IS NOT NULL drop procedure elgalego.sp_rol_crear 
go

create procedure elgalego.sp_rol_crear 
@Nombre_rol varchar (100)
	AS
		if not exists (select 1 from elgalego.rol where RolNombre=@Nombre_rol)
		insert into elgalego.rol (rolnombre,MarcaBorrado) values (@Nombre_rol, 0)
		
	GO

IF OBJECT_ID ('elgalego.sp_agrega_funcionalidad','P') IS NOT NULL drop procedure elgalego.sp_agrega_funcionalidad 
go
--select * from elgalego.rol
create procedure elgalego.sp_agrega_funcionalidad
	@Rol_id int, @Funcionalidad int
	AS
	if not exists (select 1 from elgalego.rolFuncionalidad where id_rol=@Rol_id and id_funcionalidad=@Funcionalidad)
	begin
	insert into elgalego.rolFuncionalidad values (@Rol_id,@Funcionalidad)
	end
	GO

IF OBJECT_ID ('elgalego.sp_quita_funcionalidad','P') IS NOT NULL drop procedure elgalego.sp_quita_funcionalidad 
go

create procedure elgalego.sp_quita_funcionalidad
@Rol_id int, @Funcionalidad int
	AS
		delete elgalego.rolFuncionalidad where id_funcionalidad=@Funcionalidad and id_rol=@Rol_id

	

	GO

----------------------Usuario----------------------
IF OBJECT_ID ('elgalego.sp_quita_rol','P') IS NOT NULL drop procedure elgalego.sp_quita_rol
go

create procedure elgalego.sp_quita_rol
@user_id int, @rol_id int
	AS
		declare @count int
				
		delete elgalego.UsuarioRol where id_usuario=@user_id and id_rol=@Rol_id
		
		select @count=count(1) from UsuarioRol where id_usuario=@user_id

		if @count = 1
		begin
		update u
		set u.ID_RolSel=ur.ID_Rol
		from elgalego.Usuario u
		join elgalego.UsuarioRol ur on u.ID_Usuario=ur.ID_Usuario
		end
GO

IF OBJECT_ID ('elgalego.sp_agrega_urole','P') IS NOT NULL drop procedure elgalego.sp_agrega_urole
go
--select * from elgalego.rol
create procedure elgalego.sp_agrega_urole
	@user_id int, @rol_id int
	AS
	if not exists (select 1 from elgalego.UsuarioRol where id_rol=@Rol_id and id_usuario=@user_id)
	begin
	insert into elgalego.usuariorol (id_rol,id_usuario) values (@Rol_id,@user_id)
	end
GO

IF OBJECT_ID ('elgalego.fn_username_unico') IS NOT NULL drop function elgalego.fn_username_unico
go

create function elgalego.fn_username_unico (@username nvarchar (100), @userid int) returns int
	AS 
		begin
	declare @Resultado int
	if exists (select 1 from elgalego.usuario where username=@username and id_usuario<>@userid) begin
	
	select @Resultado=0
	end else select @Resultado=1
	return @resultado
end
GO

IF OBJECT_ID ('elgalego.fnGetUserID') IS NOT NULL drop function elgalego.fnGetUserID
go

create function elgalego.fnGetUserID (@username nvarchar (100)) returns int
	AS 
		begin
	declare @Resultado int
	select @Resultado=id_usuario from elgalego.Usuario where username=@username
	
	return @resultado
end
GO


IF OBJECT_ID ('elgalego.fnTipoUser') IS NOT NULL drop function elgalego.fnTipoUser
go

create function elgalego.fnTipoUser (@userid int) returns int
	AS 
	-- devuelve 0 si no es ninguno, 1 si es cliente, 2 si es empresa	
	begin
	
	declare @Resultado int
	select @Resultado=0	
	

	if exists (select 1 from elgalego.empresa where id_usuario=@userid) 	
	select @Resultado=2
	if exists (select 1 from elgalego.cliente where id_usuario=@userid) 	
	begin
	select @Resultado=1
	end
	
	return @resultado
end
GO
--select elgalego.fnTipoUser(100);

IF OBJECT_ID ('elgalego.sp_lis_usu_roles') IS NOT NULL drop procedure elgalego.sp_lis_usu_roles
go
create procedure elgalego.sp_lis_usu_roles
@idUser int
as
	select r.id_rol, rolnombre, case when isnull(r.MarcaBorrado,0)= 0 then 1 else 0 end as rol_activo
	from elgalego.Rol r
	join elgalego.usuariorol ur on r.id_rol=ur.id_rol
	where ur.id_usuario=@idUser
go


IF OBJECT_ID ('elgalego.sp_lis_u_roles_libres') IS NOT NULL drop procedure elgalego.sp_lis_u_roles_libres
go
create procedure elgalego.sp_lis_u_roles_libres
@idUser int
as
	select r.id_rol, rolnombre	from elgalego.Rol r
	where id_rol not in (select id_rol from elgalego.usuariorol ur	where ur.id_usuario=@idUser) and isnull(r.MarcaBorrado,0)=0
go

IF OBJECT_ID ('elgalego.sp_user_Set_pass') IS NOT NULL drop procedure elgalego.sp_user_Set_pass
go

create proc elgalego.sp_user_Set_pass
@userID int, @pass nvarchar(256)
as
begin
	update elgalego.Usuario 
	set UserPass = elgalego.fn_encriptar(@pass) where id_usuario = @userID
end
go
IF OBJECT_ID ('elgalego.sp_set_user_estado') IS NOT NULL drop procedure elgalego.sp_set_user_estado
go
create proc elgalego.sp_set_user_estado
@idUser int,@estado int
as
				update elgalego.Usuario
				set MarcaBorrado = case when @estado=1 then 0 else 1 end where id_usuario=@idUser
go

------- Empresa

IF OBJECT_ID ('elgalego.spSetEmpresaEstado') IS NOT NULL drop procedure elgalego.spSetEmpresaEstado
go
create proc elgalego.spSetEmpresaEstado
@idUser int,@estado int
as
				update elgalego.Empresa
				set MarcaBorrado = case when @estado=1 then 0 else 1 end where ID_Empresa=@idUser
go

IF OBJECT_ID ('elgalego.spCreaEmpresa') IS NOT NULL drop procedure elgalego.spCreaEmpresa
go
create proc elgalego.spCreaEmpresa
@username nvarchar(60)
,@passwd nvarchar(256)
,@RazonSoc nvarchar(160)
,@Mail nvarchar(160)
,@tel nvarchar(30)
,@cuit nvarchar(100)
,@FechaCreacion nvarchar(12)
,@Calle nvarchar(100)
,@NroDom nvarchar(10)
,@NroPiso nvarchar(5)
,@NroDpto nvarchar(5)
,@Ciudad nvarchar(100)
,@CP nvarchar(20)
as
begin

	-- creo el usuario asociado a la  nueva empresa
	
	exec elgalego.sp_creaUser @username, @passwd
	-- cargo el domicilio, o si existe, tomo el id en una variable
	declare @idDomi int, @idUser int

	select @idUser=id_usuario from elgalego.Usuario where username=@username

	select @idDomi=isnull(id_domicilio,0) from elgalego.Domicilio
	where calle=@Calle and NroDomi=@NroDom and NroDpto=@NroDpto and NroPiso=@NroPiso and Ciudad=@Ciudad and CodPostal=@CP
	and isnull(marcaBorrado,0)=0

	if isnull(@idDomi,0)=0
	begin
		insert into elgalego.Domicilio (calle, NroDomi, NroDpto, NroPiso, Ciudad, CodPostal, MarcaBorrado) values
		(@calle, @NroDom, @NroDpto, @NroPiso, @Ciudad, @cp, 0)
	end

	select @idDomi=isnull(id_domicilio,0) from elgalego.Domicilio
	where calle=@Calle and NroDomi=@NroDom and NroDpto=@NroDpto and NroPiso=@NroPiso and Ciudad=@Ciudad and CodPostal=@CP
	and isnull(marcaBorrado,0)=0
	
	-- creo la empresa
	--select @idUser, @idDomi, @RazonSoc, @Mail, @tel, @cuit, convert(datetime, @FechaCreacion, 103), 0
	if not exists (select 1 from elgalego.empresa where ID_Usuario=@idUser)
	begin
		insert into elgalego.Empresa (ID_Usuario, ID_Domicilio, RazonSocial, Mail, Telefono, CUIT, FechaCreacion, MarcaBorrado) values
		(@idUser, @idDomi, @RazonSoc, @Mail, @tel, @cuit, convert(datetime, @FechaCreacion, 103), 0)
	end

	-- le agrego al usuario creado el rol de empresa
	insert into elgalego.UsuarioRol (ID_Usuario,ID_Rol)
	select @idUser, id_rol
	from elgalego.Rol where RolNombre='Empresa'

	update u
	set ID_RolSel=ID_Rol
	from elgalego.Usuario u 
	join elgalego.rol r on r.RolNombre='Empresa' and u.ID_Usuario=@idUser
end
go

IF OBJECT_ID ('elgalego.spModEmpresa') IS NOT NULL drop procedure elgalego.spModEmpresa
go
create proc elgalego.spModEmpresa
@ID_Empresa nvarchar(10)
,@Mail nvarchar(160)
,@tel nvarchar(30)
,@cuit nvarchar(100)
,@Calle nvarchar(100)
,@NroDom nvarchar(10)
,@NroPiso nvarchar(5)
,@NroDpto nvarchar(5)
,@Ciudad nvarchar(100)
,@CP nvarchar(20)
,@MarcaBorrado nvarchar(5)
as
begin

	
	--- actualizo datos domicilio
	
	update d
	set
	d.Calle=@calle,
	d.NroDomi=@NroDom,
	d.NroDpto=@NroDpto,
	d.NroPiso=@NroPiso,
	d.Ciudad=@Ciudad,
	d.CodPostal=@CP
	from elgalego.Domicilio d
	join elgalego.Empresa e on e.ID_Domicilio=d.ID_Domicilio
	where e.ID_Empresa=@ID_Empresa	
---- actualizo datos empresa
	update e 
	set 
	e.Mail=@Mail
	,e.Telefono=@tel
	,e.CUIT=@cuit
	,e.MarcaBorrado=@MarcaBorrado
	from elgalego.Empresa e 
	where ID_Empresa=@ID_Empresa
		


end
go
	
-- exec elgalego.spModEmpresa 'Razon Social Nº:5', 'larulea@gmail.com', '42569839', '11-11111111-1', 'avenida pepito', '14185', '12', 'g', 'peron' ,'9898', '0'

----- cliente

IF OBJECT_ID ('elgalego.spSetClienteBorrado') IS NOT NULL drop procedure elgalego.spSetClienteBorrado
go
create proc elgalego.spSetClienteBorrado
@idUser int
as
				update elgalego.Empresa
				set MarcaBorrado = 1  where ID_Empresa=@idUser
go


IF OBJECT_ID ('elgalego.spCreaCliente') IS NOT NULL drop procedure elgalego.spCreaCliente
go
create proc elgalego.spCreaCliente
@username nvarchar(60)
,@passwd nvarchar(256)
,@Nombre nvarchar(160)
,@Apellido nvarchar(100)
,@ID_tipoDoc nvarchar(5)
,@NDOC nvarchar(10)
,@Mail nvarchar(160)
,@tel nvarchar(30)
,@cuil nvarchar(100)
,@FechaCreacion nvarchar(12)
,@FechaNac nvarchar(12)
,@Calle nvarchar(100)
,@NroDom nvarchar(10)
,@NroPiso nvarchar(5)
,@NroDpto nvarchar(5)
,@Ciudad nvarchar(100)
,@CP nvarchar(20)
,@ntar nvarchar(60)
,@atar nvarchar(100)
,@id_ttar nvarchar(5)
,@nrotar nvarchar(20)
,@fvtar nvarchar(10)

as
begin

	-- creo el usuario asociado a la  nueva empresa
	
	exec elgalego.sp_creaUser @username, @passwd
	-- cargo el domicilio, o si existe, tomo el id en una variable
	declare @idDomi int, @idUser int

	select @idUser=id_usuario from elgalego.Usuario where username=@username

	select @idDomi=isnull(id_domicilio,0) from elgalego.Domicilio
	where calle=@Calle and NroDomi=@NroDom and NroDpto=@NroDpto and NroPiso=@NroPiso and Ciudad=@Ciudad and CodPostal=@CP
	and isnull(marcaBorrado,0)=0

	if isnull(@idDomi,0)=0
	begin
		insert into elgalego.Domicilio (calle, NroDomi, NroDpto, NroPiso, Ciudad, CodPostal, MarcaBorrado) values
		(@calle, @NroDom, @NroDpto, @NroPiso, @Ciudad, @cp, 0)
	end

	select @idDomi=isnull(id_domicilio,0) from elgalego.Domicilio
	where calle=@Calle and NroDomi=@NroDom and NroDpto=@NroDpto and NroPiso=@NroPiso and Ciudad=@Ciudad and CodPostal=@CP
	and isnull(marcaBorrado,0)=0
	

	--- inserto los datos de la tarjeta si no existen


	-- creo el cliente
	
	if not exists (select 1 from elgalego.empresa where ID_Usuario=@idUser)
	begin
		insert into elgalego.Empresa (ID_Usuario, ID_Domicilio, RazonSocial, Mail, Telefono, CUIT, FechaCreacion, MarcaBorrado) values
		(@idUser, @idDomi, @zonSoc, @Mail, @tel, @cuit, convert(datetime, @FechaCreacion, 103), 0)
	end

	-- le agrego al usuario creado el rol de empresa
	insert into elgalego.UsuarioRol (ID_Usuario,ID_Rol)
	select @idUser, id_rol
	from elgalego.Rol where RolNombre='Empresa'

	update u
	set ID_RolSel=ID_Rol
	from elgalego.Usuario u 
	join elgalego.rol r on r.RolNombre='Empresa' and u.ID_Usuario=@idUser
end
go

IF OBJECT_ID ('elgalego.spModCliente') IS NOT NULL drop procedure elgalego.spModCliente
go
create proc elgalego.spModCliente
@ID_Empresa nvarchar(10)
,@Mail nvarchar(160)
,@tel nvarchar(30)
,@cuit nvarchar(100)
,@Calle nvarchar(100)
,@NroDom nvarchar(10)
,@NroPiso nvarchar(5)
,@NroDpto nvarchar(5)
,@Ciudad nvarchar(100)
,@CP nvarchar(20)
,@MarcaBorrado nvarchar(5)
as
begin

	
	--- actualizo datos domicilio
	
	update d
	set
	d.Calle=@calle,
	d.NroDomi=@NroDom,
	d.NroDpto=@NroDpto,
	d.NroPiso=@NroPiso,
	d.Ciudad=@Ciudad,
	d.CodPostal=@CP
	from elgalego.Domicilio d
	join elgalego.Empresa e on e.ID_Domicilio=d.ID_Domicilio
	where e.ID_Empresa=@ID_Empresa	
---- actualizo datos empresa
	update e 
	set 
	e.Mail=@Mail
	,e.Telefono=@tel
	,e.CUIT=@cuit
	,e.MarcaBorrado=@MarcaBorrado
	from elgalego.Empresa e 
	where ID_Empresa=@ID_Empresa
		


end
go
-----------------------------------------------------------VISTAS-----------------------------------------------------------

if OBJECT_ID('elgalego.vwUserRolesActivos') is not null drop view elgalego.vwUserRolesActivos
go
create view elgalego.vwUserRolesActivos
as
select h.id_rol, h.RolNombre,u.Username from elgalego.rol h
join elgalego.usuariorol uh on h.id_rol=uh.id_rol
join elgalego.Usuario u on uh.id_usuario=u.id_usuario
where  isnull(h.MarcaBorrado,0)=0
go

if OBJECT_ID('elgalego.vwGradoPublicacion') is not null drop view elgalego.vwGradoPublicacion
go
create view elgalego.vwGradoPublicacion
as
select r.RubroNombre, p.Titulo ,e.Estado, g.GradoNombre, p.FechaEvento ,p.FechaPublicado 
from elgalego.Publicacion p
join elgalego.Rubro r on p.ID_Rubro=r.ID_Rubro
join elgalego.Grado g on p.ID_Grado=g.ID_Grado
join elgalego.Estado e on p.ID_Estado=e.id_Estado
where e.Estado='Publicada'
go

if OBJECT_ID('elgalego.vwEmpresa') is not null drop view elgalego.vwEmpresa
go
create view elgalego.vwEmpresa
as
select ID_Empresa, e.ID_Usuario, e.ID_Domicilio, isnull(u.Username,'') Username, RazonSocial, isnull(Mail,'') Mail, isnull(Telefono,'') Telefono, isnull(CUIT,'') CUIT, FechaCreacion, isnull(e.MarcaBorrado,0) MarcaBorrado 
,isnull(d.Calle,'') Calle ,isnull(d.NroDomi,0) NroDomi, isnull(d.NroPiso,0) NroPiso,isnull(d.NroDpto,0) NroDpto, isnull(d.Ciudad,'') Ciudad, isnull(d.codpostal,'') CP
from elgalego.Empresa e
left join elgalego.Usuario u on e.ID_Usuario=u.ID_Usuario
left join elgalego.Domicilio d on e.ID_Domicilio=d.ID_Domicilio

go

if OBJECT_ID('elgalego.vwCliente') is not null drop view elgalego.vwCliente
go

create view elgalego.vwCliente
as
select 
ID_Cliente
, e.ID_Usuario
, e.ID_Domicilio
,E.ID_Tarjeta
, isnull(u.Username,'') Username
, e.Nombre
,E.Apellido
,E.ID_TipoDoc
,TD.TipoDocumento
,E.NroDoc
, isnull(Mail,'') Mail
, isnull(Telefono,'') Telefono
, isnull(CUIL,'') CUIL
, convert(nvarchar(15),FechaCreacion,103) FechaCreacion
,convert(nvarchar(15),E.FechaNac,103) FechaNac
, isnull(e.MarcaBorrado,0) MarcaBorrado 
,isnull(d.Calle,'') Calle 
,isnull(d.NroDomi,0) NroDomi
, isnull(d.NroPiso,0) NroPiso
,isnull(d.NroDpto,0) NroDpto
, isnull(d.Ciudad,'') Ciudad
, isnull(d.codpostal,'') CP
, ISNULL(T.NOMBRE,'') AS NOMBRETARJETA
, ISNULL (T.APELLIDO,'') AS APELLIDOTARJETA
, ISNULL (T.ID_TIPOTARJ,0) AS ID_TIPOTARJ
, ISNULL (T.NROTARJETA,0) AS NROTARJETA
, ISNULL(CONVERT (NVARCHAR,T.FechaVenc,103),'') AS FECHAVENCTARJ
from elgalego.Cliente e
left join elgalego.Usuario u on e.ID_Usuario=u.ID_Usuario
left join elgalego.Domicilio d on e.ID_Domicilio=d.ID_Domicilio
left join elgalego.TipoDocumento td on e.ID_TipoDoc=td.ID_TipoDoc
left join elgalego.Tarjeta t on e.ID_Tarjeta=T.ID_Tarjeta
LEFT JOIN elgalego.TipoTarjeta TT ON T.ID_TipoTarj=TT.ID_TipoTarj

go

--elgalego.spSelectTabla 'elgalego.vwcliente'
-- select elgalego.fnuserenabled ('admin')

