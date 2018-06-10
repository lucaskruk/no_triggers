use GD1C2018
go

------------------------------------------------------------------------------------------------------------------------
------------------------------STORED PROCEDURES-------------------------------------------------------------------------
/*******************PARA ROL*******************************************/
/*Se decide que se creen los roles en estado ACTIVO*/

GO
create procedure [NO_TRIGGERS].sp_rol_crear 
@Nombre_rol varchar (100)
	AS
		insert into 
		[NO_TRIGGERS].rol values (@Nombre_rol, 1)

	GO
--exec [NO_TRIGGERS].sp_rol_crear 'Rey de los minisupers'
GO
create procedure [no_triggers].sp_rol_dar_de_baja
@Nombre_rol varchar (100)
	AS
		update [NO_TRIGGERS].rol set rol_estado=0
		WHERE @Nombre_rol=rol_nombre
	GO
create procedure [no_triggers].sp_rol_modificar_estado
@Nombre_rol varchar (100), @estado_modificado int
	AS
	update [NO_TRIGGERS].rol set rol_estado=@estado_modificado
	WHERE @Nombre_rol=rol_nombre
	GO
-- exec [NO_TRIGGERS].sp_rol_dar_de_baja 'Rey de los minisupers'

GO
create procedure [NO_TRIGGERS].sp_asignar_funcionalidad
	@Rol_nombre varchar (100), @Funcionalidad int
	AS
	insert into [NO_TRIGGERS].rol_por_funcionalidad values ((select id_rol from [NO_TRIGGERS].rol r where r.rol_nombre=@Rol_nombre),@Funcionalidad)
	GO

create procedure [NO_TRIGGERS].sp_desasignar_funcionalidad
@Rol_nombre varchar (100), @Funcionalidad int
	AS
		delete [NO_TRIGGERS].rol_por_funcionalidad where id_funcionalidad=@Funcionalidad and id_rol=(select id_rol from [NO_TRIGGERS].rol where rol_nombre=@Rol_nombre)
	GO

create function [NO_TRIGGERS].fn_chequear_asignacion_rol 
(@Rol_nombre varchar(100), @Funcionalidad int) returns bit
	AS
		begin
			declare @Resultado bit
		if( (select id_rol_por_funcionalidad from [NO_TRIGGERS].rol_por_funcionalidad rf, [NO_TRIGGERS].rol r, [NO_TRIGGERS].funcionalidad f
				where r.rol_nombre=@Rol_nombre and f.id_funcionalidad=@Funcionalidad and rf.id_rol=r.id_rol and rf.id_funcionalidad=f.id_funcionalidad)is NOT NULL)
			set @Resultado=1
		else
			set @Resultado=0
	return @resultado
end
GO
-- select [NO_TRIGGERS].sp_chequear_asignacion_rol ('ADMINISTRADOR' ,1)

create function [NO_TRIGGERS].fn_chequear_existencia_rol
(@Rol_nombre varchar(100)) returns bit
	AS 
		begin
	declare @Resultado bit
	if((select id_rol from [NO_TRIGGERS].rol r where r.rol_nombre=@Rol_nombre)IS NOT NULL)
		set @Resultado=1
	else
		set @Resultado=0
	return @Resultado
end
GO

create procedure [NO_TRIGGERS].sp_modificar_rol /*Se decide que todos los campos pueden ser modificados a la vez, por lo cual se verifica cuales campos quiere modificar el usuario*/
@Nombre_rol_a_modificar varchar (100), @Nuevo_nombre varchar (100), @estado_nuevo int, @funcionalidad_nueva int
	AS
		if ( @Nuevo_nombre !='')
		update [NO_TRIGGERS].rol set rol_nombre=@Nuevo_nombre where @Nombre_rol_a_modificar=rol_nombre
		if (@estado_nuevo is not null)
		update [NO_TRIGGERS].rol set rol_estado=@estado_nuevo where @Nombre_rol_a_modificar=rol_nombre

		if(@funcionalidad_nueva is not null)---------agrega la funcionalidad
			begin
				if not exists (select 1 from [NO_TRIGGERS].Rol_por_funcionalidad rf join [NO_TRIGGERS].Rol r on rf.id_rol=r.id_rol where r.rol_nombre=@Nombre_rol_a_modificar)
					begin
						declare @rolid int 
						select @rolid=id_rol from [NO_TRIGGERS].Rol where rol_nombre=@Nombre_rol_a_modificar
						insert into [NO_TRIGGERS].Rol_por_funcionalidad (id_rol,id_funcionalidad) values (@rolid,@funcionalidad_nueva)
					end
			end
GO

create procedure [NO_TRIGGERS].sp_mostrar_roles
	AS
		select * from [NO_TRIGGERS].rol
	GO

/*******************PARA LOGIN*******************************************/
/*create procedure [NO_TRIGGERS].sp_chequear_intentos_fallidos
@Nombre_usuario nvarchar (100)
AS
declare @cantidad_intentos int, @habilitado bit
set @cantidad_intentos= (select usuario_cantidad_intentos_fallidos from [NO_TRIGGERS].usuario us where us.usuario_nombre=@Nombre_usuario)
if (@cantidad_intentos<3)
set @habilitado=1
else
set @habilitado=0
GO*/

create function [NO_TRIGGERS].fn_encriptar (@contrasenia nvarchar(256))
returns nvarchar(255)
as begin
    return(SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('SHA2_256', @contrasenia)), 3, 255))
end
GO

create procedure [NO_TRIGGERS].sp_Incrementar_Intentos_fallidos (@usuario nvarchar(100))
as

if((select usuario_cantidad_intentos_fallidos from [NO_TRIGGERS].Usuario where @usuario= usuario_username ) <3)
	begin
	update [NO_TRIGGERS].Usuario
set usuario_cantidad_intentos_fallidos =  usuario_cantidad_intentos_fallidos+1 where  @usuario=usuario_username
	end
else
	begin	
	update [NO_TRIGGERS].Usuario
	set usuario_cantidad_intentos_fallidos =  usuario_cantidad_intentos_fallidos+1,  usuario_habilitado = 0 where  @usuario=usuario_username
end

go

create procedure [NO_TRIGGERS].sp_a_Cero_Intentos_fallidos (@usuario nvarchar(100))
as
update [NO_TRIGGERS].Usuario
set usuario_cantidad_intentos_fallidos =  0
where usuario_username = @usuario
go

create function [NO_TRIGGERS].fn_validar_password (@usuario nvarchar(100), @password nvarchar(256))
returns bit
as begin
declare @resultado bit, @password2 nvarchar(256)
set @password2 = [NO_TRIGGERS].fn_encriptar(@password)
if (((SELECT usuario_password FROM [NO_TRIGGERS].Usuario WHERE usuario_username=@usuario) = @password2) and ((select usuario_cantidad_intentos_fallidos from [NO_TRIGGERS].Usuario where usuario_username = @usuario)<=3)) and ((select usuario_habilitado from [NO_TRIGGERS].Usuario where usuario_username=@usuario)=1)
	begin	
		--Ejecutar desde C# el borrar intentos fallidos
		set @resultado = 1
	end
ELSE
	begin
		--Ejecutar desde C# el sumar intentos fallidos
		set @resultado=0
	end
return @resultado
END
GO

--select [NO_TRIGGERS].fn_validar_password ('USER_GUEST2', 'user_guest')
--exec [NO_TRIGGERS].sp_Incrementar_Intentos_fallidos'USER_GUEST2'


/***********************PARA USUARIO*************************************/
GO
create procedure [NO_TRIGGERS].sp_crear_usuario --se decide que el usuario quede habiliado al crearse--
@nombreusuario nvarchar(100), @nombre nvarchar(200), @apellido nvarchar(100), @password nvarchar(100), @email nvarchar(200), @fechanacimiento datetime, @tipodocumento int, @numero_documento nvarchar(50), @numerotelefono nvarchar(50), @rolasignado int, @hotel int --RECIBE EL HOTEL DEL ADMINISTRADOR
AS
BEGIN
DECLARE @responseMessage nvarchar(250) 
	SET NOCOUNT ON 
	BEGIN TRY 
		INSERT INTO [NO_TRIGGERS].Usuario VALUES (@nombreusuario, @nombre, @apellido, [NO_TRIGGERS].fn_encriptar(@password), @email, @fechanacimiento, 0, @tipodocumento, @numero_documento, @numerotelefono,1, @rolasignado, NULL) --Sami dice: modificar lo de hotel ya que debe tomar el hotel del administrador que lo crea, o enviarselo desde c#
		INSERT INTO [NO_TRIGGERS].usuario_por_hotel VALUES ((select id_usuario from [NO_TRIGGERS].usuario us where us.usuario_username=@nombreusuario),@hotel)
		SET @responseMessage= 'Usuario creado con exito'
	END TRY
	BEGIN CATCH 
		SET @responseMessage= ERROR_MESSAGE()
	END CATCH
END
go
/*
insert into [NO_TRIGGERS].usuario 
(usuario_username,usuario_nombre,usuario_apellido,usuario_password,usuario_email,usuario_fecha_nacimiento
,usuario_cantidad_intentos_fallidos,id_tipo_documento,usuario_numero_documento,usuario_telefono,usuario_habilitado,id_rol,id_hotel)
values
('USER_GUEST3', 'User','Generico', [no_triggers].fn_encriptar('user_guest'),null,getdate(),0,null,null,null,1,2,1)
*/

create function [NO_TRIGGERS].fn_permitir_cambios_administrador(@usuarioAdministrador nvarchar(100), @usuarioAModificar nvarchar (100)) --verifica que el usuario que quiera modificar el administrador trabaje en el mismo hotel
RETURNS bit
AS
BEGIN
DECLARE @aprobador bit
	IF(((select usxh.id_hotel from [NO_TRIGGERS].Usuario_por_hotel usxh, [NO_TRIGGERS].Usuario us WHERE us.usuario_username=@usuarioAdministrador and usxh.id_usuario=us.id_usuario)=
	(SELECT usxh.id_hotel FROM [NO_TRIGGERS].Usuario_por_hotel usxh, [NO_TRIGGERS].Usuario us WHERE usxh.id_usuario=us.id_usuario and us.usuario_username=@usuarioAModificar))and((select r.rol_nombre from [NO_TRIGGERS].Usuario u, [NO_TRIGGERS].Rol r where r.id_rol = u.id_rol and u.usuario_username=@usuarioAdministrador)='Administrador'))
		BEGIN
			set @aprobador=1
		END
	ELSE
		BEGIN
		set @aprobador=0
		END
return @aprobador
END
GO

--SELECT [NO_TRIGGERS].fn_permitir_cambios_administrador('REYDELOSMINISUPERS','USER_GUEST3')

create proc [NO_TRIGGERS].sp_Cambiar_Contrasenia
@Usuario nvarchar(100), @NuevaContraseña nvarchar(256)
as
begin
	update [NO_TRIGGERS].Usuario 
	set usuario_password = [NO_TRIGGERS].fn_encriptar(@NuevaContraseña) where usuario_username = @Usuario
end
go

--exec [NO_TRIGGERS].sp_Cambiar_Contraseña 'USER_GUEST2', 'pepita'

create function [NO_TRIGGERS].fn_trow_Exception(@Mensaje nvarchar(100))
returns nvarchar(100)
as begin
	return @mensaje
end
go

create function [NO_TRIGGERS].fn_throw_respuesta(@resultado bit)
returns nvarchar(100)
as begin
	return @resultado
end
go

create proc [NO_TRIGGERS].sp_Dar_Baja_Usuario
@UsuarioAdministrador nvarchar(100), @UsuarioADarBAja nvarchar(100)
as
begin
DECLARE @responseMessage nvarchar(250)  
	if(([NO_TRIGGERS].fn_permitir_cambios_administrador(@UsuarioAdministrador,@UsuarioADarBAja)=1) and ((select r.rol_nombre from [NO_TRIGGERS].Usuario u, [NO_TRIGGERS].Rol r where r.id_rol = u.id_rol and u.usuario_username=@usuarioAdministrador)='Administrador'))
	begin
			begin try
				update [NO_TRIGGERS].Usuario
				set usuario_habilitado = 0 where @UsuarioADarBAja = usuario_username
				select [NO_TRIGGERS].fn_trow_Exeption('Dado de Baja Exitosamente')
			end try 
			begin catch
				select [NO_TRIGGERS].fn_trow_Exeption('Usuario Inexistente')
			end catch
	end
	else
		begin
			select [NO_TRIGGERS].fn_trow_Exeption('No tenes permisos')
		end 
	end
go

--exec [NO_TRIGGERS].sp_Dar_Baja_Usuario 'REYDELOSMINISUPERS', 'USER_GUEST3'

create function [NO_TRIGGERS].fn_Devolve_Usuarios (@Usuario nvarchar(100))
returns table
as
	RETURN (select * from [NO_TRIGGERS].Usuario where usuario_username = @Usuario)
go

--select * from [NO_TRIGGERS].fn_Devolve_Usuarios('REYDELOSMINISUPERS')

create proc [NO_TRIGGERS].sp_modificarUsuarios 
@UsuarioAMofificar nvarchar(100),@nombreusuario nvarchar(100), @nombre nvarchar(200), @apellido nvarchar(100), @email nvarchar(200), @fechanacimiento datetime, @tipodocumento int, @numero_documento nvarchar(50), @numerotelefono nvarchar(50),@rol int, @hotel int
as
declare @id int
	set @id = (SElect id_usuario from [NO_TRIGGERS].Usuario where usuario_username = @UsuarioAMofificar)
	update [NO_TRIGGERS].Usuario
	set usuario_nombre = @nombre, usuario_apellido = @apellido, usuario_username = @nombreusuario, usuario_email = @email, usuario_fecha_nacimiento = @fechanacimiento, id_tipo_documento=(select t.id_tipo_documento from [NO_TRIGGERS].Tipo_documento t where t.tipo_de_documento_nombre = @tipodocumento), usuario_numero_documento = @numero_documento, usuario_telefono = @numerotelefono, id_rol = @rol
	where usuario_username = @UsuarioAMofificar
	update [NO_TRIGGERS].usuario_por_hotel
	set id_hotel=@hotel
	where id_usuario = @id
go

create function [NO_TRIGGERS].fn_hoteles_de_usuario (@Usuario nvarchar(100))
returns int
as	
begin
	declare @auxiliar int
	 set @auxiliar =(SELECT count(id_hotel) FROM [NO_TRIGGERS].Usuario us, [NO_TRIGGERS].usuario_por_hotel uxh WHERE us.usuario_username=@Usuario and us.id_usuario=uxh.id_usuario)
	 return @auxiliar
end
go

create function [NO_TRIGGERS].fn_castear_DataTime(@fecha nvarchar(50))
returns datetime
as
begin
	return (select CONVERT(datetime,@fecha,121))
end
go


/*************************PAIS- CIUDAD - DIRECCION*************************************************/
go

create procedure [NO_TRIGGERS].sp_add_pais
@pais nvarchar(100), @nacionalidad nvarchar(100)
as
	if((select distinct count (id_pais) from [NO_TRIGGERS].Pais p where p.pais_nacionalidad=@nacionalidad and p.pais_nombre=@pais)<1)
	insert into [NO_TRIGGERS].Pais values (@pais,@nacionalidad)
go

--exec [NO_TRIGGERS].sp_add_pais 'israel','judio'

create procedure [NO_TRIGGERS].sp_add_ciudad
@ciudad nvarchar(100), @pais nvarchar(100), @nacionalidad nvarchar(100)
as
declare @auxiliar int
exec [NO_TRIGGERS].sp_add_pais @pais, @nacionalidad
	if((select distinct count (id_ciudad) from [NO_TRIGGERS].Ciudad c, [NO_TRIGGERS].Pais p where c.ciudad_nombre=@ciudad and p.pais_nombre=@pais and p.pais_nacionalidad=@nacionalidad and p.id_pais=c.id_pais)<1)
	begin
	set @auxiliar = (select id_pais from [NO_TRIGGERS].Pais p where p.pais_nacionalidad=@nacionalidad and p.pais_nombre=@pais)
	insert into [NO_TRIGGERS].Ciudad values (@auxiliar,@ciudad)
	end
GO

--exec [NO_TRIGGERS].sp_add_ciudad 'jerusalen','israel','judio'

create procedure [NO_TRIGGERS].sp_add_direccion 
@calle nvarchar(200), @altura int, @piso int, @departamento nvarchar(10), @ciudad nvarchar(200), @paisresidencia nvarchar(100), @NombreNacionalidadResidencia nvarchar(100)
as
declare @auxiliar int
exec [NO_TRIGGERS].sp_add_ciudad @ciudad,@paisresidencia,@NombreNacionalidadResidencia
	if((@departamento is not null) and (@piso is not null))
		if((select count(id_direccion) from [NO_TRIGGERS].direccion d, [NO_TRIGGERS].Ciudad c , [NO_TRIGGERS].Pais p WHERE d.direccion_calle=@calle and d.direccion_altura=@altura and d.direccion_departamento=@departamento and d.direccion_piso=@piso and d.id_ciudad=c.id_ciudad and p.id_pais=c.id_pais)<=0)
		begin
			set @auxiliar= (select ciu.id_ciudad from [NO_TRIGGERS].Ciudad ciu, [NO_TRIGGERS].Pais pai where ciu.ciudad_nombre=@ciudad and pai.pais_nacionalidad=@NombreNacionalidadResidencia and pai.pais_nombre=@paisresidencia and ciu.id_pais=pai.id_pais)	
			insert into [NO_TRIGGERS].Direccion values (@calle,@altura,@piso, @departamento,@auxiliar)
		end
	if (@departamento IS NULL and @piso IS NULL)
		if((select count(id_direccion) from [NO_TRIGGERS].direccion d, [NO_TRIGGERS].Ciudad c , [NO_TRIGGERS].Pais p WHERE d.direccion_calle=@calle and d.direccion_altura=@altura and d.direccion_departamento is null  and d.direccion_piso is null and d.id_ciudad=c.id_ciudad and p.id_pais=c.id_pais)<=0)	
		begin
			set @auxiliar= (select ciu.id_ciudad from [NO_TRIGGERS].Ciudad ciu, [NO_TRIGGERS].Pais pai where ciu.ciudad_nombre=@ciudad and pai.pais_nacionalidad=@NombreNacionalidadResidencia and pai.pais_nombre=@paisresidencia and ciu.id_pais=pai.id_pais)
			insert into [NO_TRIGGERS].Direccion values (@calle,@altura,@piso, @departamento,@auxiliar)
		end
		
go


/********************CLIENTES***************************************************/


create function [NO_TRIGGERS].fn_cliente_habilitado (@ClienteNombre nvarchar(100), @ClienteApellido nvarchar(100), @ClienteEmail nvarchar(200))
returns bit

as
	begin
		DECLARE @auxiliar bit
		set @auxiliar = (SELECT cl.cliente_estado FROM [NO_TRIGGERS].Cliente cl WHERE cl.cliente_nombre=@ClienteNombre and cl.cliente_apellido=@ClienteApellido and cl.cliente_email=@ClienteEmail)
		return @auxiliar
	end
go

create procedure [NO_TRIGGERS].sp_modificar_estado @Cliente nvarchar(100),@ClienteApellido nvarchar(100), @ClienteEmail nvarchar(200), @Estado bit
as
	update [NO_TRIGGERS].Cliente 
	set cliente_estado=@Estado 
	where cliente_nombre=@Cliente and cliente_apellido=@ClienteApellido and cliente_email=@ClienteEmail
go

create procedure [NO_triggers].sp_add_cliente 
@nombre nvarchar(100), @apellido nvarchar(100), @email nvarchar(100), @fechanacimiento datetime, @tipodocumento int, @numerodocumento nvarchar(50), @telefono nvarchar(50), @calle nvarchar(100), @altura int, @piso int, @departamento nvarchar(50), @ciudadNombre nvarchar (100), @paisResidencia nvarchar(100), @nacionalidadresidencia nvarchar(100), @paisnacimiento nvarchar(100), @nacionalidadnacimiento nvarchar(100)
as
begin
	declare @id_direccion_auxiliar int , @id_pais_proveniencia int
	exec [NO_TRIGGERS].sp_add_pais @paisnacimiento, @nacionalidadnacimiento
	set @id_pais_proveniencia = (select id_pais from [NO_TRIGGERS].Pais p where p.pais_nacionalidad=@nacionalidadnacimiento and p.pais_nombre=@paisnacimiento)
	exec [NO_TRIGGERS].sp_add_direccion @calle,@altura,@piso,@departamento,@ciudadNombre,@paisresidencia,@nacionalidadresidencia
	if((@departamento is not null) and (@piso is not null))
			set @id_direccion_auxiliar = (select id_direccion from [NO_TRIGGERS].direccion d, [NO_TRIGGERS].Ciudad c , [NO_TRIGGERS].Pais p WHERE d.direccion_calle=@calle and d.direccion_altura=@altura and d.direccion_departamento=@departamento and d.direccion_piso=@piso and d.id_ciudad=c.id_ciudad and p.id_pais=c.id_pais)
	if((@departamento IS NULL) and (@piso IS NULL))
			set @id_direccion_auxiliar= (select id_direccion from [NO_TRIGGERS].direccion d, [NO_TRIGGERS].Ciudad c , [NO_TRIGGERS].Pais p WHERE d.direccion_calle=@calle and d.direccion_altura=@altura and d.direccion_departamento is null  and d.direccion_piso is null and d.id_ciudad=c.id_ciudad and p.id_pais=c.id_pais)
	if((select count (id_cliente) from [NO_TRIGGERS].Cliente cl where cl.cliente_nombre=@nombre and cl.cliente_apellido=@apellido and cl.cliente_email=@email and cl.cliente_fecha_nacimiento=@fechanacimiento and cl.cliente_numero_documento=@numerodocumento and cl.id_tipo_documento=@tipodocumento and cl.id_direccion=@id_direccion_auxiliar and cl.id_pais=@id_pais_proveniencia)<=0)
			insert into [NO_TRIGGERS].cliente values (1,@nombre,@apellido,@email,NULL,@fechanacimiento,@tipodocumento,@numerodocumento,@telefono,@id_direccion_auxiliar,@id_pais_proveniencia)
end
go


Create FUNCTION [NO_TRIGGERS].fn_buscar_cliente_para_modificar (@Nombre nvarchar(100), @Apellido nvarchar(100), @TipoDocumento int, @DocumentoNumero nvarchar(50), @email nvarchar(200))
returns table 
as 
	return (select cliente_nombre, cliente_apellido, cliente_email, cliente_email_invalido, tipo_de_documento_nombre ,cliente_numero_documento, cliente_telefono, direccion_calle, direccion_altura, direccion_piso, direccion_departamento,ciudad_nombre, p.pais_nombre, p.pais_nacionalidad from [NO_TRIGGERS].Cliente cl, [NO_TRIGGERS].Direccion d, [NO_TRIGGERS].Ciudad c , [NO_TRIGGERS].Pais p, [NO_TRIGGERS].Tipo_documento td 
	WHERE (@nombre is null or cl.cliente_nombre = @Nombre) and (@apellido is null or cl.cliente_apellido=@Apellido) and (@documentoNumero is null or cl.cliente_numero_documento = @DocumentoNumero) AND (@email is null or cl.cliente_email=@email) AND (@tipodocumento is null or cl.id_tipo_documento=@tipodocumento) AND cl.id_direccion=d.id_direccion AND d.id_ciudad=c.id_ciudad and p.id_pais=c.id_pais and cl.id_tipo_documento = td.id_tipo_documento)
go

create procedure [NO_TRIGGERS].sp_modify_cliente @nombre nvarchar(100),@apellido nvarchar(100), @tipoDocumento int, @numerodocumento nvarchar(50), @email nvarchar(200), @nombrenuevo nvarchar(100), @apellidonuevo nvarchar(100), @emailnuevo nvarchar(100), @fechanacimientonuevo nvarchar(100), @tipodocumentonuevo int, @documentonuevo nvarchar(50), @telefononuevo nvarchar(50), @callenueva nvarchar(100), @alturanueva int, @pisonuevo int, @departamentonuevo int, @ciudadnueva nvarchar(100), @paisnuevo nvarchar(100), @nacionalidadnueva nvarchar(100)
as
declare @id_cliente_modificado int, @id_direccion_nuevo int
	set @id_cliente_modificado = (select id_cliente from [NO_TRIGGERS].Cliente c WHERE c.cliente_nombre=@nombre and c.cliente_apellido=@apellido and c.id_tipo_documento=@tipoDocumento and c.cliente_numero_documento=@numerodocumento and c.cliente_email=@email)
	exec [NO_TRIGGERS].sp_add_direccion @callenueva,@alturanueva,@pisonuevo,@departamentonuevo,@ciudadnueva,@paisnuevo,@nacionalidadnueva
	if((@departamentonuevo is not null) and (@pisonuevo is not null))
	set @id_direccion_nuevo =(select id_direccion from [NO_TRIGGERS].direccion d, [NO_TRIGGERS].Ciudad c , [NO_TRIGGERS].Pais p WHERE d.direccion_calle=@callenueva and d.direccion_altura=@alturanueva and d.direccion_departamento=@departamentonuevo and d.direccion_piso=@pisonuevo and d.id_ciudad=c.id_ciudad and p.id_pais=c.id_pais)
	if((@departamentonuevo IS NULL) and (@pisonuevo IS NULL))
	set @id_direccion_nuevo =(select id_direccion from [NO_TRIGGERS].direccion d, [NO_TRIGGERS].Ciudad c , [NO_TRIGGERS].Pais p WHERE d.direccion_calle=@callenueva and d.direccion_altura=@alturanueva and (d.direccion_departamento IS NULL) and (d.direccion_piso IS NULL) and d.id_ciudad=c.id_ciudad and p.id_pais=c.id_pais)
update [NO_TRIGGERS].Cliente set cliente_nombre=@nombrenuevo, cliente_apellido=@apellidonuevo, cliente_email=@emailnuevo, id_tipo_documento=@tipodocumentonuevo, cliente_numero_documento=@documentonuevo, cliente_telefono=@telefononuevo, id_direccion=@id_direccion_nuevo where id_cliente=@id_cliente_modificado
go

--exec [NO_TRIGGERS].sp_modify_cliente 'AARON','CASTILLO',2,'92973579','aaron_Castillo@gmail.com','AARON','CASTILLITO','ARITONCASTILLO@AES.COM',NULL,1,'123123','44444444','CALLEFALSA',1234,NULL,NULL,'SPRINGFIELD','ESTADOS UNIDOS', 'YANKEE'
CREATE PROCEDURE [NO_TRIGGERS].sp_Dar_Baja_Cliente 
@Nombre nvarchar(100), @Apellido nvarchar(100), @TipoDocumento int, @DocumentoNumero nvarchar(50), @email nvarchar(200)
as 
declare @id_cliente_modificado int
set @id_cliente_modificado = (select id_cliente from [NO_TRIGGERS].Cliente c WHERE c.cliente_nombre=@nombre and c.cliente_apellido=@apellido and c.id_tipo_documento=@tipoDocumento and c.cliente_numero_documento=@DocumentoNumero and c.cliente_email=@email)
update [NO_TRIGGERS].Cliente set cliente_estado = 0 where id_cliente=@id_cliente_modificado
go

CREATE PROCEDURE [NO_TRIGGERS].sp_Dar_Alta_Cliente 
@Nombre nvarchar(100), @Apellido nvarchar(100), @TipoDocumento int, @DocumentoNumero nvarchar(50), @email nvarchar(200)
as 
declare @id_cliente_modificado int
set @id_cliente_modificado = (select id_cliente from [NO_TRIGGERS].Cliente c WHERE c.cliente_nombre=@nombre and c.cliente_apellido=@apellido and c.id_tipo_documento=@tipoDocumento and c.cliente_numero_documento=@DocumentoNumero and c.cliente_email=@email)
update [NO_TRIGGERS].Cliente set cliente_estado = 0 where id_cliente=@id_cliente_modificado
go

/*******************************************HOTEL********************************************************/


--select top 1000 * from [NO_TRIGGERS].fn_buscar_cliente_para_modificar('AARON','Castillo',null,97645361,null)
--------------------------------------------------------------------------------------------------------------------------
/*Creación de tablas */---------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
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
id_tipo_documento int,
usuario_numero_documento nvarchar(50),
usuario_telefono nvarchar(50),
usuario_habilitado bit,
id_rol int
CONSTRAINT pk_id_usuario PRIMARY KEY CLUSTERED (id_usuario)
)

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
tipo_habitacion_descripcion nvarchar(200),
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
id_hotel int,
CONSTRAINT pk_baja_de_hotel PRIMARY KEY CLUSTERED (id_baja_de_hotel)
)

--------------------------------------------------------------------------------------------------------------------------
-------------------------------- Migracion De datos-----------------------------------------------------------------------
-- Funcuionalidad
insert into [NO_TRIGGERS].funcionalidad (funcionalidad_descripcion)
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

--Rol
insert into [NO_TRIGGERS].rol (rol_nombre,rol_estado)
values 
    ('RECEPCIONISTA', 1),--1
    ('GUEST', 1),--2
    ('ADMINISTRADOR', 1)--3

go

--Rol x Funcionalidad
insert into [NO_TRIGGERS].rol_por_funcionalidad (id_rol,id_funcionalidad)
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

--estado reserva
insert into [NO_TRIGGERS].estado_reserva (estado_reserva_descripcion)
values
	('RESERVA CORRECTA'),
	('RESERVA MODIFICADA'),
	('RESERVA CANCELADA POR RECEPCION'),
	('RESERVA CANCELADA POR CLIENTE'),
	('RESERVA CANCELADA POR NO-SHOW'),
	('RESERVA EFECTIVIZADA')
go

--metodo de pago
insert into [NO_TRIGGERS].metodo_de_pago (metodo_de_pago_nombre,metodo_de_pago_detalles)
values 
	('TARJETA DE CREDITO','PAGO EN CUOTAS'),
	('TARJETA DE DEBITO','EN ARS'),
	('TARJETA DE CREDITO','UNICO PAGO EN ARS'),
	('TARJETA DE DEBITO','EN USD'),
	('EFECTIVO','EN ARS'),
	('EFECTIVO', 'EN USD')
go
-- Tipo de documento
insert into [NO_TRIGGERS].tipo_documento (tipo_de_documento_nombre) values 
('D.N.I.'),('Pasaporte')

--PAIS
INSERT INTO [NO_TRIGGERS].[pais] ([pais_nombre],pais_nacionalidad) values
	('Argentina','ARGENTINO'),('Brasil','BRASILERO'),('Uruguay','URUGUAYO'),('Indefinido','Indefinido');
--select * from [no_triggers].pais
insert into [NO_TRIGGERS].usuario
values
('USER_GUEST1', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'),null,getdate(),0,null,null,null,1,2),--agregar para todos los hoteles
('USER_GUEST2', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'),null,getdate(),0,null,null,null,1,2),
('USER_GUEST3', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'),null,getdate(),0,null,null,null,1,2),
('USER_GUEST4', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'),null,getdate(),0,null,null,null,1,2),
('USER_GUEST5', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'),null,getdate(),0,null,null,null,1,2),
('USER_GUEST6', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'), null,getdate(),0,null,null,null,1,2),
('USER_GUEST7', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'), null,getdate(),0,null,null,null,1,2),
('USER_GUEST8', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'), null,getdate(),0,null,null,null,1,2),
('USER_GUEST9', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'), null,getdate(),0,null,null,null,1,2),
('USER_GUEST10', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'), null,getdate(),0,null,null,null,1,2),
('USER_GUEST11', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'), null,getdate(),0,null,null,null,1,2),
('USER_GUEST12', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'), null,getdate(),0,null,null,null,1,2),
('USER_GUEST13', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'), null,getdate(),0,null,null,null,1,2),
('USER_GUEST14', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'), null,getdate(),0,null,null,null,1,2),
('USER_GUEST15', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'), null,getdate(),0,null,null,null,1,2)
GO


--select * from [no_triggers].usuario

INSERT INTO [NO_TRIGGERS].usuario_por_hotel
VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15)

INSERT INTO [NO_TRIGGERS].usuario_por_hotel
VALUES
(16,3)

--CIUDAD------------------------11
insert into [no_triggers].ciudad (id_pais,ciudad_nombre)
select distinct 
(select id_pais from [NO_TRIGGERS].pais where pais_nombre='Argentina'),
Hotel_Ciudad from gd_esquema.Maestra
insert into [no_triggers].ciudad (id_pais,ciudad_nombre)
select id_pais, 'Indefinida' as ciudad_nombre from [NO_TRIGGERS].pais where pais_nombre='Indefinido'
--select * from [no_triggers].ciudad

--Direccion--------------------96958 (96943 + 15)
insert into [NO_TRIGGERS].direccion (direccion_calle,direccion_altura,direccion_piso,direccion_departamento, id_ciudad)
select distinct hotel_calle, hotel_nro_calle, null, null, cd.id_ciudad from gd_esquema.Maestra mr 
join [NO_TRIGGERS].ciudad cd on mr.Hotel_Ciudad=cd.ciudad_nombre
union 
select distinct 
cliente_dom_calle, Cliente_Nro_Calle, Cliente_Piso, Cliente_Depto,  (select id_ciudad from [NO_TRIGGERS].ciudad where ciudad_nombre='Indefinida')
from gd_esquema.Maestra

--select * from [no_triggers].direccion

-- Hotel  ---- 15
insert into [NO_TRIGGERS].hotel(id_direccion,hotel_cantidad_estrellas,hotel_recarga_estrella,hotel_fecha_creacion,hotel_estado)
select distinct dr.id_direccion, mr.Hotel_CantEstrella,mr.Hotel_Recarga_Estrella, NULL,1 
from gd_esquema.Maestra mr
join [NO_TRIGGERS].ciudad cd on mr.Hotel_Ciudad=cd.ciudad_nombre
join [NO_TRIGGERS].direccion dr on mr.Hotel_Calle=dr.direccion_calle and cd.id_ciudad=dr.id_ciudad and mr.Hotel_Nro_Calle=dr.direccion_altura
--select * from [no_triggers].hotel

-- Clientes ----------------------------- 96944
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

--Tipo de Habitacion ------- 5
insert into [NO_TRIGGERS].tipoDeHabitacion (tipo_habitacion_descripcion,tipo_habitacion_porcentual,tipo_habitacion_codigo)
select distinct 
	Habitacion_Tipo_Descripcion,
	Habitacion_Tipo_Porcentual,
	Habitacion_Tipo_Codigo
from gd_esquema.Maestra
--select * from [NO_TRIGGERS].tipoDeHabitacion
go

--Habitacion -----------------------------  332
insert into [NO_TRIGGERS].habitacion (habitacion_numero,habitacion_piso,habitacion_frente,Id_tipo_habitacion,Id_hotel)
select distinct 
	Habitacion_Numero,
	Habitacion_Piso,
	Habitacion_Frente,
	th.id_tipo_habitacion,
	hl.id_hotel
from gd_esquema.Maestra m
	join [NO_TRIGGERS].tipoDeHabitacion th on m.Habitacion_Tipo_Codigo=th.tipo_habitacion_codigo
	join [NO_TRIGGERS].ciudad cd on m.Hotel_Ciudad=cd.ciudad_nombre
	join [NO_TRIGGERS].direccion dr on m.Hotel_Calle=dr.direccion_calle and m.Hotel_Nro_Calle=dr.direccion_altura and cd.id_ciudad=dr.id_ciudad
	JOIN [NO_TRIGGERS].hotel hl on hl.id_direccion=dr.id_direccion

--Regimen--------------4
insert into [NO_TRIGGERS].regimen (regimen_descripcion,regimen_precio,regimen_estado)
select distinct 
	Regimen_Descripcion, 
	Regimen_Precio, 
	1 
	from gd_esquema.Maestra

--Reserva ---------------------------96944
declare @reservaCorrecta int 
select @reservaCorrecta=id_estado_reserva from [NO_TRIGGERS].estado_reserva where estado_reserva_descripcion = 'RESERVA CORRECTA'
 
insert into [NO_TRIGGERS].reserva (reserva_fecha_inicio,reserva_cantidad_noches,reserva_numero_codigo,ID_reserva_cambiada_por_user,ID_hotel,ID_habitacion,ID_reserva_estado,ID_regimen)
select distinct
	Reserva_Fecha_Inicio,
	Reserva_Cant_Noches,
	Reserva_Codigo,
	NULL,
	h.id_hotel,
	hab.id_habitacion,
	@reservaCorrecta,
	r.id_regimen
	from gd_esquema.Maestra m
join [NO_TRIGGERS].ciudad cd on m.Hotel_Ciudad=cd.ciudad_nombre
join [NO_TRIGGERS].direccion d on d.direccion_calle = m.Hotel_Calle and d.direccion_altura = m.Hotel_Nro_Calle and d.direccion_piso is null and d.id_ciudad=cd.id_ciudad
join [NO_TRIGGERS].hotel h on h.id_direccion = d.id_direccion
join [NO_TRIGGERS].habitacion hab on m.Habitacion_Frente = hab.habitacion_frente and m.Habitacion_Piso = hab.habitacion_piso and m.Habitacion_Numero = hab.habitacion_numero and h.id_hotel = hab.Id_hotel
join [NO_TRIGGERS].regimen r on r.regimen_descripcion = m.Regimen_Descripcion and r.regimen_precio = m.Regimen_Precio

--Estadia -------------------------86300
insert into [NO_TRIGGERS].estadia (estadia_cantidad_noches,estadia_fecha_inicio,id_cliente,id_habitacion,id_reserva)
select distinct
	m.Estadia_Cant_Noches,
	m.Estadia_Fecha_Inicio,
	c.id_cliente,
	hab.id_habitacion,
	r.id_regimen
from gd_esquema.Maestra m
join [NO_TRIGGERS].cliente c on m.Cliente_Mail = c.cliente_email and m.Cliente_Apellido = c.cliente_apellido and m.Cliente_Nombre = c.cliente_nombre and c.cliente_numero_documento=m.Cliente_Pasaporte_Nro
join [NO_TRIGGERS].regimen r on r.regimen_descripcion = m.Regimen_Descripcion and r.regimen_precio = m.Regimen_Precio
join [NO_TRIGGERS].direccion dr on m.Hotel_Calle = dr.direccion_calle and m.Hotel_Nro_Calle=dr.direccion_altura
join [NO_TRIGGERS].hotel  h on dr.id_direccion=h.id_direccion
join [NO_TRIGGERS].habitacion hab on m.Habitacion_Piso = hab.habitacion_piso and m.Habitacion_Frente =  hab.habitacion_frente and m.Habitacion_Numero = hab.habitacion_numero 
and hab.Id_hotel=h.id_hotel
where m.Estadia_Cant_Noches is not null

--max 96944


/*select * from [NO_TRIGGERS].estadia e
where e.estadia_cantidad_noches is not null*/

--Consumible ------4
insert into [NO_TRIGGERS].consumible (consumible_descripcion,consumible_precio,consumible_codigo)
select distinct 
	m.Consumible_Descripcion,
	m.Consumible_Precio,
	m.Consumible_Codigo
from gd_esquema.Maestra m
where Consumible_Codigo is not null

--Consumible_por_estadia------------------¿? No le encuentro proposito, y no me da con el total de items facturados, creo que item factura cumple la funcion de esta tabla
insert into [NO_TRIGGERS].consumible_por_estadia
		SELECT cons.id_consumible,est.id_estadia
		FROM [NO_TRIGGERS].consumible cons,[NO_TRIGGERS].estadia est, gd_esquema.Maestra m, [NO_TRIGGERS].Reserva res
		WHERE (m.Consumible_Codigo=cons.consumible_codigo) and (est.id_reserva = res.id_reserva) and (m.Factura_Nro IS NOT NULL) and (m.Reserva_Codigo = res.reserva_numero_codigo)
GO

--Factura ------------------86300
insert into [NO_TRIGGERS].factura (factura_fecha,factura_numero,factura_tipo,factura_total,id_cliente,id_estadia,id_hotel)
select distinct
 m.Factura_Fecha,
 m.Factura_Nro,
 null as factura_tipo,
 m.Factura_Total,
 c.id_cliente,
 e.id_estadia,
 h.id_hotel
from gd_esquema.Maestra m
join [NO_TRIGGERS].cliente c on m.Cliente_Apellido = c.cliente_apellido and m.Cliente_Mail = c.cliente_email and m.Cliente_Fecha_Nac = c.cliente_fecha_nacimiento and m.Cliente_Pasaporte_Nro = c.cliente_numero_documento
join [NO_TRIGGERS].estadia e on e.id_cliente = c.id_cliente and m.Estadia_Cant_Noches = e.estadia_cantidad_noches and m.Estadia_Fecha_Inicio = e.estadia_fecha_inicio 
join [NO_TRIGGERS].direccion d on d.direccion_altura = m.Hotel_Nro_Calle and d.direccion_calle = m.Hotel_Calle and d.direccion_piso is null
join [NO_TRIGGERS].hotel h on h.id_direccion = d.id_direccion
where m.Factura_Nro is not null


--Item factura ---286003 
insert into [NO_TRIGGERS].item_factura (item_factura_cantidad,item_factura_monto,id_consumible,id_factura)
select distinct
	m.Item_Factura_Cantidad,
	m.Item_Factura_Monto,
	c.id_consumible,
	f.id_factura
from gd_esquema.Maestra m 
join [NO_TRIGGERS].factura f on m.Factura_Fecha = f.factura_fecha and m.Factura_Nro = f.factura_numero and m.Factura_Total = f.factura_total
join [NO_TRIGGERS].estadia e on e.id_estadia = f.id_estadia and m.Estadia_Cant_Noches = e.estadia_cantidad_noches and m.Estadia_Fecha_Inicio = e.estadia_fecha_inicio
left join [NO_TRIGGERS].consumible c on m.Consumible_Codigo = c.consumible_codigo and m.Consumible_Descripcion = c.consumible_descripcion and m.Consumible_Precio = c.consumible_precio 





--Regimen por hotel--

insert into [NO_TRIGGERS].regimen_por_hotel
Select distinct reg.id_regimen, hot.id_hotel
FROM [NO_TRIGGERS].regimen reg, [NO_TRIGGERS].hotel hot, gd_esquema.Maestra m, [NO_TRIGGERS].direccion dir
where (m.Regimen_Descripcion=reg.regimen_descripcion and m.Regimen_Precio=reg.regimen_precio) and (m.Hotel_Calle=dir.direccion_calle and m.Hotel_Nro_Calle=dir.direccion_altura) and (hot.hotel_cantidad_estrellas=m.Hotel_CantEstrella and hot.hotel_recarga_estrella=m.Hotel_Recarga_Estrella)

------------------------------------------------------------------------------------------------------------------------
--Relaciones------------------------------------------------------------------------------------------------------------
Alter table [no_triggers].ciudad add
constraint fk_id_ciudad_pais foreign key (id_pais) references [no_triggers].pais(id_pais)

Alter table [no_triggers].direccion 
add constraint fk_id_ciudad_direccion foreign key (id_ciudad) references [no_triggers].ciudad(id_ciudad)

Alter table [no_triggers].rol_por_funcionalidad add
constraint fk_id_rol foreign key (id_rol) references [no_triggers].rol(id_rol)
,constraint fk_id_funcionalidad foreign key (id_funcionalidad) references [no_triggers].funcionalidad(id_funcionalidad) ----------revisar puede que falten

Alter table [no_triggers].hotel add
constraint fk_id_hotel_direccion foreign key (id_direccion) references [no_triggers].direccion(id_direccion)

Alter table [no_triggers].usuario add
constraint fk_id_usuario_rol foreign key (id_rol) references [no_triggers].rol(id_rol),
constraint fk_id_usuario_tipo_documento foreign key (id_tipo_documento) references [no_triggers].tipo_documento(id_tipo_documento),
constraint uk_usuario_username unique (usuario_username)

ALTER TABLE [NO_TRIGGERS].usuario_por_hotel add
constraint fk_id_usuarioPorHotel foreign key (id_usuario) references [no_triggers].usuario (id_usuario),
constraint fk_id_hotelPor_usuario foreign key (id_hotel) references [no_triggers].hotel(id_hotel)

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
constraint fk_id_reserva_regimen foreign key (id_regimen) references [no_triggers].regimen(id_regimen),
constraint fk_id_reserva_cambiada_por_user foreign key (id_reserva_cambiada_por_user) references [no_triggers].usuario(id_usuario)

Alter table [no_triggers].estadia add
constraint fk_id_estadia_habitacion foreign key (id_habitacion) references [no_triggers].habitacion(id_habitacion),
constraint fk_id_estadia_reserva foreign key (id_reserva) references [no_triggers].reserva(id_reserva),
constraint fk_id_estadia_cliente foreign key (id_cliente) references [no_triggers].cliente(id_cliente)

Alter table [no_triggers].regimen_por_hotel add
constraint fk_id_regimen foreign key (id_regimen) references [no_triggers].regimen(id_regimen),
constraint fk_id_hotelporRegimen foreign key (id_hotel) references [no_triggers].hotel(id_hotel)

Alter table [no_triggers].factura add 
constraint fk_id_factura_estadia foreign key (id_estadia) references [no_triggers].estadia(id_estadia),
constraint fk_id_factura_hotel foreign key (id_hotel) references [no_triggers].hotel(id_hotel),
constraint fk_id_factura_cliente foreign key (id_cliente) references [no_triggers].cliente(id_cliente)

Alter table [no_triggers].item_factura add
constraint fk_id_numero_factura foreign key (id_factura) references [no_triggers].factura(id_factura),
constraint fk_id_item_consumible foreign key (id_consumible) references [no_triggers].consumible(id_consumible)

Alter table [no_triggers].baja_de_hotel add
constraint fk_id_hotel_de_Baja foreign key (id_hotel) references [no_triggers].hotel(id_hotel)

Alter table [no_triggers].consumible_por_estadia add
constraint fk_estadia_por_consumible foreign key (id_estadia) references [no_triggers].estadia(id_estadia),
constraint fk_consumiblePor_consumible foreign key (id_consumible) references [no_triggers].consumible(id_consumible)