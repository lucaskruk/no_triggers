
------------------------------------------------------------------------------------------------------------------------
------------------------------STORED PROCEDURES-------------------------------------------------------------------------
/*******************PARA ROL*******************************************/
/*Se decide que se creen los roles en estado ACTIVO*/

IF OBJECT_ID ('[NO_TRIGGERS].sp_rol_crear','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_rol_crear 
go
create procedure [NO_TRIGGERS].sp_rol_crear 
@Nombre_rol varchar (100)
	AS
		insert into 
		[NO_TRIGGERS].rol (rol_nombre,rol_estado) values (@Nombre_rol, 1)

	GO
--exec [NO_TRIGGERS].sp_rol_crear 'Rey de los minisupers'
GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_rol_dar_de_baja','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_rol_dar_de_baja
go

create procedure [no_triggers].sp_rol_dar_de_baja
@Nombre_rol varchar (100)
	AS
		update [NO_TRIGGERS].rol set rol_estado=0
		WHERE @Nombre_rol=rol_nombre
	GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_rol_modificar_estado','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_rol_modificar_estado 
go
create procedure [no_triggers].sp_rol_modificar_estado
@Nombre_rol varchar (100), @estado_modificado int
	AS
	update [NO_TRIGGERS].rol set rol_estado=@estado_modificado
	WHERE @Nombre_rol=rol_nombre
	GO
-- exec [NO_TRIGGERS].sp_rol_dar_de_baja 'Rey de los minisupers'
GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_asignar_funcionalidad','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_asignar_funcionalidad 
go

create procedure [NO_TRIGGERS].sp_asignar_funcionalidad
	@Rol_nombre varchar (100), @Funcionalidad int
	AS
	insert into [NO_TRIGGERS].rol_por_funcionalidad values ((select id_rol from [NO_TRIGGERS].rol r where r.rol_nombre=@Rol_nombre),@Funcionalidad)
	GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_desasignar_funcionalidad','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_desasignar_funcionalidad 
go

create procedure [NO_TRIGGERS].sp_desasignar_funcionalidad
@Rol_nombre varchar (100), @Funcionalidad int
	AS
		delete [NO_TRIGGERS].rol_por_funcionalidad where id_funcionalidad=@Funcionalidad and id_rol=(select id_rol from [NO_TRIGGERS].rol where rol_nombre=@Rol_nombre)
	GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_chequear_asignacion_rol') IS NOT NULL drop function [NO_TRIGGERS].sp_chequear_asignacion_rol
go


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


IF OBJECT_ID ('[NO_TRIGGERS].fn_chequear_existencia_rol') IS NOT NULL drop function [NO_TRIGGERS].fn_chequear_existencia_rol
go


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

IF OBJECT_ID ('[NO_TRIGGERS].sp_modificar_rol','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_modificar_rol
go

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


IF OBJECT_ID ('[NO_TRIGGERS].sp_mostrar_roles','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_mostrar_roles
go

create procedure [NO_TRIGGERS].sp_mostrar_roles
	AS
		select * from [NO_TRIGGERS].rol
	GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_listar_funcionalidades','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_listar_funcionalidades
go

create procedure [no_triggers].sp_listar_funcionalidades
as
begin
	Select * from [NO_TRIGGERS].Funcionalidad
end
go




/*******************PARA LOGIN*******************************************/

-- exec [no_triggers].sp_incrementar_intentos_fallidos 'UsuarioAdministrador2';
IF OBJECT_ID ('[NO_TRIGGERS].sp_incrementar_intentos_fallidos','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_incrementar_intentos_fallidos
go

create procedure [NO_TRIGGERS].sp_Incrementar_Intentos_fallidos (@usuario nvarchar(100))
as

if((select usuario_cantidad_intentos_fallidos from [NO_TRIGGERS].Usuario where @usuario= usuario_username ) <2)
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

IF OBJECT_ID ('[NO_TRIGGERS].sp_a_cero_intentos_fallidos','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_a_cero_intentos_fallidos
go
create procedure [NO_TRIGGERS].sp_a_Cero_Intentos_fallidos (@usuario nvarchar(100))
as
update [NO_TRIGGERS].Usuario
set usuario_cantidad_intentos_fallidos =  0
where usuario_username = @usuario
go

IF OBJECT_ID ('[NO_TRIGGERS].sp_lista_hoteles_disponibles','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_lista_hoteles_disponibles
go
create procedure [NO_TRIGGERS].sp_lista_hoteles_disponibles (@usuario nvarchar(100))
as

select uh.id_hotel, isnull(hotel_nombre ,'') as hotel_nombre
from [NO_TRIGGERS].usuario_por_hotel uh
join [NO_TRIGGERS].Hotel hh on uh.id_hotel=hh.id_hotel
where uh.id_usuario=@usuario

go


IF OBJECT_ID ('[NO_TRIGGERS].sp_set_hotel_logueado','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_set_hotel_logueado
go
create procedure [NO_TRIGGERS].sp_set_hotel_logueado (@usuario nvarchar(100), @hotel_id int)
as
begin
update us
set us.usuario_hotel_logueado=@hotel_id,us.usuario_last_activity=GETDATE()
from [NO_TRIGGERS].usuario us
where us.usuario_username=@usuario
end
go



-- exec [no_triggers].sp_desloguea_user 'Admin2',1


IF OBJECT_ID ('[NO_TRIGGERS].sp_desloguea_user','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_desloguea_user
go
create procedure [NO_TRIGGERS].sp_desloguea_user (@usuario nvarchar(100))
as
begin
update us
set us.usuario_hotel_logueado=0
from [NO_TRIGGERS].usuario us
where us.usuario_username=@usuario
end
go


IF OBJECT_ID ('[NO_TRIGGERS].fn_get_logueo') IS NOT NULL drop function [NO_TRIGGERS].fn_get_logueo
go

create function [NO_TRIGGERS].fn_get_logueo (@usuario nvarchar(256))
returns int
as begin
    declare @result int
	select @result=isnull(us.usuario_hotel_logueado,0)
	from [NO_TRIGGERS].usuario us 
	where us.usuario_username=@usuario
	return @result
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_encriptar') IS NOT NULL drop function [NO_TRIGGERS].fn_encriptar
go

create function [NO_TRIGGERS].fn_encriptar (@contrasenia nvarchar(256))
returns nvarchar(255)
as begin
    return(SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('SHA2_256', @contrasenia)), 3, 255))
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_chequear_usuario_si_habilitado') IS NOT NULL drop function [NO_TRIGGERS].fn_chequear_usuario_si_habilitado
go

create function [no_triggers].fn_chequear_usuario_si_habilitado (@usuario nvarchar(100))
returns int
as
begin
declare @result int
select @result=usuario_habilitado from [NO_TRIGGERS].Usuario where usuario_username=@usuario;
return @result

end

go

IF OBJECT_ID ('[NO_TRIGGERS].fn_chequear_usuario_si_multihotel') IS NOT NULL drop function [NO_TRIGGERS].fn_chequear_usuario_si_multihotel
go

-- select [NO_TRIGGERS].fn_chequear_usuario_si_multihotel('user_guest1')
create function [no_triggers].fn_chequear_usuario_si_multihotel (@usuario nvarchar(100))
returns int
as
begin
declare @result int, @count int

select @count=count(1) from [NO_TRIGGERS].usuario_por_hotel uh 
join [NO_TRIGGERS].Usuario us on uh.id_usuario=us.id_usuario
where us.usuario_username=@usuario

if (@count >1)  begin select @result=1 end else begin select @result=0 end

return @result

end

go

IF OBJECT_ID ('[NO_TRIGGERS].fn_get_id_hotel_usuario') IS NOT NULL drop function [NO_TRIGGERS].fn_get_id_hotel_usuario
go
-- select [NO_TRIGGERS].fn_chequear_usuario_si_multihotel('user_guest1')
create function [no_triggers].fn_get_id_hotel_usuario (@usuario nvarchar(100))
returns int
as
begin
declare @result int, @multi int
select @multi=[NO_TRIGGERS].fn_chequear_usuario_si_multihotel(@usuario)
if (@multi=0)
begin
select @result=max(uh.id_hotel) from [no_triggers].usuario_por_hotel uh
join [no_triggers].Usuario us on uh.id_usuario=us.id_usuario
where us.usuario_username=@usuario
end
else select @result=0
return @result

end

go

IF OBJECT_ID ('[NO_TRIGGERS].sp_lista_hotel_usuario') IS NOT NULL drop procedure [NO_TRIGGERS].sp_lista_hotel_usuario
go
create procedure [NO_TRIGGERS].sp_lista_hotel_usuario (@usuario nvarchar(100))
as 
begin
select hotel_nombre, h.id_hotel from [NO_TRIGGERS].hotel h
join [NO_TRIGGERS].usuario_por_hotel uh on h.id_hotel=uh.id_hotel
join [NO_TRIGGERS].Usuario u on uh.id_usuario=u.id_usuario
where usuario_username=@usuario
end
go
--exec [no_triggers].sp_lista_hotel_usuario 'admin'
IF OBJECT_ID ('[NO_TRIGGERS].fn_validar_password') IS NOT NULL drop function [NO_TRIGGERS].fn_validar_password
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


IF OBJECT_ID ('[NO_TRIGGERS].sp_crear_usuario') IS NOT NULL drop procedure [NO_TRIGGERS].sp_crear_usuario
go

create procedure [NO_TRIGGERS].sp_crear_usuario --se decide que el usuario quede habilitado al crearse--
@nombreusuario nvarchar(100), @nombre nvarchar(200), @apellido nvarchar(100), @password nvarchar(100), @email nvarchar(200), @fechanacimiento datetime, @tipodocumento int, @numero_documento nvarchar(50), @numerotelefono nvarchar(50), @rolasignado int, @hotel int --RECIBE EL HOTEL DEL ADMINISTRADOR
AS
BEGIN
DECLARE @responseMessage nvarchar(250) 
	SET NOCOUNT ON 
	BEGIN TRY 
		INSERT INTO [NO_TRIGGERS].Usuario 
		(usuario_username,usuario_nombre,usuario_apellido,usuario_password,usuario_email,usuario_fecha_nacimiento,usuario_cantidad_intentos_fallidos
		,id_tipo_documento,usuario_numero_documento,usuario_telefono,usuario_habilitado,id_rol--,id_hotel
		)
		VALUES (@nombreusuario, @nombre, @apellido, [NO_TRIGGERS].fn_encriptar(@password), @email, @fechanacimiento, 0,@tipodocumento, @numero_documento, @numerotelefono,1, @rolasignado) --Sami dice: modificar lo de hotel ya que debe tomar el hotel del administrador que lo crea, o enviarselo desde c#
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


IF OBJECT_ID ('[NO_TRIGGERS].fn_permitir_cambios_administrador') IS NOT NULL drop function [NO_TRIGGERS].fn_permitir_cambios_administrador
go

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
IF OBJECT_ID ('[NO_TRIGGERS].sp_Cambiar_Contrasenia') IS NOT NULL drop procedure [NO_TRIGGERS].sp_Cambiar_Contrasenia
go

create proc [NO_TRIGGERS].sp_Cambiar_Contrasenia
@Usuario nvarchar(100), @NuevaContraseña nvarchar(256)
as
begin
	update [NO_TRIGGERS].Usuario 
	set usuario_password = [NO_TRIGGERS].fn_encriptar(@NuevaContraseña) where usuario_username = @Usuario
end
go

--exec [NO_TRIGGERS].sp_Cambiar_Contraseña 'USER_GUEST2', 'pepita'

IF OBJECT_ID ('[NO_TRIGGERS].fn_trow_Exception') IS NOT NULL drop function [NO_TRIGGERS].fn_trow_Exception
go

create function [NO_TRIGGERS].fn_trow_Exception(@Mensaje nvarchar(100))
returns nvarchar(100)
as begin
	return @mensaje
end
go

IF OBJECT_ID ('[NO_TRIGGERS].fn_throw_respuesta') IS NOT NULL drop function [NO_TRIGGERS].fn_throw_respuesta
go
create function [NO_TRIGGERS].fn_throw_respuesta(@resultado bit)
returns nvarchar(100)
as begin
	return @resultado
end
go
IF OBJECT_ID ('[NO_TRIGGERS].sp_Dar_Baja_Usuario') IS NOT NULL drop procedure [NO_TRIGGERS].sp_Dar_Baja_Usuario
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

IF OBJECT_ID ('[NO_TRIGGERS].fn_Devolve_Usuarios') IS NOT NULL drop function [NO_TRIGGERS].fn_Devolve_Usuarios
go
create function [NO_TRIGGERS].fn_Devolve_Usuarios (@Usuario nvarchar(100))
returns table
as
	RETURN (select * from [NO_TRIGGERS].Usuario us where us.usuario_username = @Usuario)
go

--select * from [NO_TRIGGERS].fn_Devolve_Usuarios('REYDELOSMINISUPERS')
IF OBJECT_ID ('[NO_TRIGGERS].sp_modificarUsuarios') IS NOT NULL drop procedure [NO_TRIGGERS].sp_modificarUsuarios
go
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
Create PROCEDURE [NO_TRIGGERS].sp_crear_hotel @nombreAdministrador nvarchar(100), @email nvarchar(100), @telefono nvarchar(50), @calle nvarchar(100), @altura int, @ciudad nvarchar(100), @pais nvarchar(100), @nacionalidadpais nvarchar(100), @cantidadestrellas int
as
declare @id_direccion_agregar int
	if((select id_rol from [NO_TRIGGERS].Usuario us where us.usuario_username=@nombreAdministrador and us.usuario_email=@email and us.usuario_telefono=@telefono)=3)
	begin
	exec [NO_TRIGGERS].sp_add_direccion @calle,@altura, NULL,NULL,@ciudad,@pais,@nacionalidadpais
	set @id_direccion_agregar=(select id_direccion from [NO_TRIGGERS].direccion d, [NO_TRIGGERS].Ciudad c , [NO_TRIGGERS].Pais p WHERE d.direccion_calle=@calle and d.direccion_altura=@altura and( d.direccion_departamento is null ) and (d.direccion_piso is null) and d.id_ciudad=c.id_ciudad and p.id_pais=c.id_pais)
	insert into [NO_TRIGGERS].Hotel values (@id_direccion_agregar,@cantidadestrellas,NULL,getdate(),1)
	end

go

--EXEC [NO_TRIGGERS].sp_crear_hotel 'UsuarioAdministrador2','samathaa@frbahotel.com','46220530','CALLEFALSA','123','CORDOBA', 'ESPANA', 'GALLEGO', 5

create procedure [NO_TRIGGERS].sp_asignar_regimen @id_hotel int, @id_regimen int
as
if((select count(id_regimen_por_hotel) from [NO_TRIGGERS].Regimen_por_hotel rxh where rxh.id_hotel=@id_hotel and rxh.id_regimen=@id_regimen)<=0)
insert into [NO_TRIGGERS].Regimen_por_hotel values (@id_regimen,@id_hotel)
go

create procedure [NO_TRIGGERS].sp_modifcar_hotel @id_hotel_a_modificar int,@calle nvarchar(100), @altura int, @ciudad nvarchar (100),@pais nvarchar(100), @nacionalidad nvarchar(100),@cantidadestrellas int, @recargaestrella int
as
declare @id_direccion_hotel int
exec [NO_TRIGGERS].sp_add_direccion @calle,@altura, NULL,NULL,@ciudad,@pais,@nacionalidad
set @id_direccion_hotel=(select id_direccion from [NO_TRIGGERS].direccion d, [NO_TRIGGERS].Ciudad c , [NO_TRIGGERS].Pais p WHERE d.direccion_calle=@calle and d.direccion_altura=@altura and( d.direccion_departamento is null ) and (d.direccion_piso is null) and d.id_ciudad=c.id_ciudad and p.id_pais=c.id_pais)
update [NO_TRIGGERS].Hotel set hotel_cantidad_estrellas=@cantidadestrellas, hotel_recarga_estrella=@recargaestrella,id_direccion=@id_direccion_hotel where id_hotel=@id_hotel_a_modificar
go

Create FUNCTION [NO_TRIGGERS].fn_buscar_hotel_para_modificar ( @cantidadestrellas int, @ciudad nvarchar(100), @pais nvarchar(100))
returns table 
as 
	return (select h.id_hotel, h.hotel_fecha_creacion, h.hotel_cantidad_estrellas, h.hotel_recarga_estrella, h.hotel_estado, d.direccion_calle, d.direccion_altura, c.ciudad_nombre, p.pais_nombre from [NO_TRIGGERS].Hotel h, [NO_TRIGGERS].Direccion d, [NO_TRIGGERS].Ciudad c, [NO_TRIGGERS].Pais p WHERE (@cantidadestrellas is null or h.hotel_cantidad_estrellas=@cantidadestrellas) AND h.id_direccion=d.id_direccion AND d.id_ciudad=c.id_ciudad and p.id_pais=c.id_pais and (p.pais_nombre=@pais or @pais is null) and (c.ciudad_nombre=@ciudad or @ciudad is null))
go

create function [no_triggers].fn_existencia_de_reservas_futuras (@idhotel int, @fechafin datetime) --probar!
returns bit
as
begin
declare @resultado bit
	if(@fechafin>= cast(cast(getdate() as date) as datetime))
		begin
			if((select count(id_reserva) from [NO_TRIGGERS].Reserva r where r.reserva_fecha_inicio between cast(cast(getdate() as date) as datetime) AND @fechafin and r.id_hotel=@idhotel)=1 or (SELECT count(id_estadia) FROM[NO_TRIGGERS].Estadia est,[NO_TRIGGERS].Reserva r WHERE (DATEADD(day,est.estadia_cantidad_noches,est.estadia_fecha_inicio)) BETWEEN cast(cast(getdate() as date) as datetime) AND @fechafin and r.id_hotel=@idhotel and est.id_reserva=r.id_reserva and r.id_hotel=@idhotel)=1)
				set @resultado =0 --no se podria realizar
			else
				set @resultado =1
		end
		else
			begin
				set @resultado = 0 -- para el caso que sea una fecha pasada
			end
return @resultado
end
go
--select [NO_TRIGGERS].fn_existencia_de_reservas_futuras(1,'20180610')
 
create procedure [NO_TRIGGERS].sp_dardebajahotel @idhotel int , @fechafin datetime
as 
begin
	if (((select [NO_TRIGGERS].fn_existencia_de_reservas_futuras(@idhotel,@fechafin))!=0) and (select h.hotel_estado from [NO_TRIGGERS].hotel h where h.id_hotel=@idhotel)=1)
	begin
		update [NO_TRIGGERS].Hotel set hotel_estado=0 where id_hotel=@idhotel
		insert into [NO_TRIGGERS].Baja_de_hotel values (getdate(),@fechafin,@idhotel)
	end

end
go



Create procedure [NO_TRIGGERS].sp_dardealtahotel @idhotel int
as
begin
declare @idauxiliar int
	if((select hotel_estado from [NO_TRIGGERS].Hotel where id_hotel=@idhotel)=0)
	begin
		update [NO_TRIGGERS].Hotel set hotel_estado=1 where id_hotel=@idhotel
		set @idauxiliar = (select top 1 id_baja_de_hotel from [NO_TRIGGERS].Baja_de_hotel where id_hotel=@idhotel order by baja_hotel_fecha_inicio desc )
		update [NO_TRIGGERS].Baja_de_hotel set baja_hotel_fecha_fin=getdate() where @idauxiliar=id_baja_de_hotel
	end
end
go

/*********************************HABITACION******************************************************/
Create procedure [NO_TRIGGERS].sp_create_habitacion 
@idhotel int, @numeroHabitacion int, @piso int, @habitacionfrente nvarchar(10), @tipoHabitacion int, @descripcionhabitacion nvarchar(200) 
as
begin
	if ((select count (habitacion_numero) from [NO_TRIGGERS].Habitacion h where h.id_hotel=@idhotel and h.habitacion_numero=@numeroHabitacion) <=0) --Me fijo que solo se pueda crear si no hay ninguna habitacion con el mismo numero
	insert into [NO_TRIGGERS].Habitacion values (@numerohabitacion,@piso,@habitacionfrente,1,0,@descripcionhabitacion,@tipoHabitacion,@idhotel)

end
go

create procedure [NO_TRIGGERS].sp_modify_habitacion
@idhotel int , @idhabitacion int , @numeronuevo int, @pisonuevo int, @ubicacionnueva nvarchar(10),@nuevadescripcion nvarchar(200)
as 
begin
declare @bitauxiliar int
set @bitauxiliar = (select count(id_habitacion) from [NO_TRIGGERS].Habitacion WHERE id_hotel=@idhotel and id_habitacion=@idhabitacion)
	if( @bitauxiliar<=1)
		begin
			update [NO_TRIGGERS].Habitacion set habitacion_numero=@numeronuevo , habitacion_piso=@pisonuevo, habitacion_frente=@ubicacionnueva, habitacion_descripcion=@nuevadescripcion
		end
end
go


--exec [NO_TRIGGERS].sp_modifcar_hotel 1, 'bolivia', 100, 'miami', 'EEUU', 'asd', 8, 20
--select top 1000 * from [NO_TRIGGERS].fn_buscar_cliente_para_modificar('AARON','Castillo',null,97645361,null)


