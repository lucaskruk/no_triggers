


------------------------------------------------------------------------------------------------------------------------
------------------------------STORED PROCEDURES-------------------------------------------------------------------------
/*------------------AUXILIARES------------*/

USE GD1C2018;
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_count_parameters') IS NOT NULL drop function [NO_TRIGGERS].fn_count_parameters
go
create function [NO_TRIGGERS].fn_count_parameters (@spname nvarchar(256))
returns int
as begin
declare @res int
SELECT @res= count(1)
--SO.name AS [ObjectName],
--SO.Type_Desc AS [ObjectType (UDF/SP)],
--P.parameter_id AS [ParameterID],
--P.name AS [ParameterName],
--TYPE_NAME(P.user_type_id) AS [ParameterDataType],
--P.max_length AS [ParameterMaxBytes],
--P.is_output AS [IsOutPutParameter]
FROM sys.objects AS SO
INNER JOIN sys.parameters AS P 
ON SO.OBJECT_ID = P.OBJECT_ID
WHERE SO.OBJECT_ID IN ( SELECT OBJECT_ID 
FROM sys.objects
WHERE TYPE IN ('P','FN')) and SCHEMA_NAME(SCHEMA_ID)='NO_TRIGGERS' and so.name=@spname
--ORDER BY SO.name, P.parameter_id

return @res
end
GO

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

----- este SP loguea al usuario
IF OBJECT_ID ('[NO_TRIGGERS].sp_set_hotel_logueado','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_set_hotel_logueado
go
create procedure [NO_TRIGGERS].sp_set_hotel_logueado (@usuario nvarchar(100), @hotel_id int)
as
begin

		---elimina todo lo que haya quedado de un cierre inesperado
		if not exists (select * from [NO_TRIGGERS].tablaControl where cierre_exitoso=1) 
		begin 
			update [NO_TRIGGERS].Usuario
			set usuario_hotel_logueado=0,id_rol_asignado=0;
		end

		update us
		set us.usuario_hotel_logueado=@hotel_id,us.usuario_last_activity=GETDATE()
		from [NO_TRIGGERS].usuario us
		where us.usuario_username=@usuario

		declare @rolecnt int
		select @rolecnt= count(1) 
		from [NO_TRIGGERS].usuario_roles ur 
		join [NO_TRIGGERS].Usuario u on ur.id_usuario=u.id_usuario 
		join [NO_TRIGGERS].Rol r on ur.id_rol=r.id_rol
		where u.usuario_username=@usuario and r.rol_estado=1

		if @rolecnt = 1
		begin
			update us
			set us.id_rol_asignado=ur.id_rol
			from [NO_TRIGGERS].Usuario us join [NO_TRIGGERS].usuario_roles ur on us.id_usuario=ur.id_usuario
		end

		update [NO_TRIGGERS].tablaControl set cierre_exitoso=0;

end
go


-- exec [no_triggers].sp_set_hotel_logueado 'Admin',1


IF OBJECT_ID ('[NO_TRIGGERS].sp_desloguea_user','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_desloguea_user
go
create procedure [NO_TRIGGERS].sp_desloguea_user (@usuario nvarchar(100))
as
begin

update us
set us.usuario_hotel_logueado=0,us.id_rol_asignado=0
from [NO_TRIGGERS].usuario us
where us.usuario_username=@usuario

--confirma que el sistema tuvo un cierre normal.

update [NO_TRIGGERS].tablaControl set cierre_exitoso=1;

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
join [NO_TRIGGERS].Hotel hl on uh.id_hotel=hl.id_hotel
where us.usuario_username=@usuario and hl.hotel_estado=1

if (@count >1)  begin select @result=1 end else begin select @result=0 end

return @result

end

go

IF OBJECT_ID ('[NO_TRIGGERS].fn_check_multirole') IS NOT NULL drop function [NO_TRIGGERS].fn_check_multirole
go

-- select [NO_TRIGGERS].fn_chequear_usuario_si_multihotel('user_guest1')
create function [no_triggers].fn_check_multirole (@usuario nvarchar(100))
returns int
as
begin
declare @result int, @count int

select @count=count(1) from [NO_TRIGGERS].usuario_roles uh 
join [NO_TRIGGERS].Usuario us on uh.id_usuario=us.id_usuario
join [NO_TRIGGERS].Rol r on uh.id_rol=r.id_rol
where us.usuario_username=@usuario and r.rol_estado=1

if (@count >1)  begin select @result=1 end else begin select @result=0 end

return @result

end

go


IF OBJECT_ID ('[NO_TRIGGERS].fn_get_id_hotel_usuario') IS NOT NULL drop function [NO_TRIGGERS].fn_get_id_hotel_usuario
go
-- select [NO_TRIGGERS].fn_get_id_hotel_usuario('admin')
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
			join [no_triggers].Hotel  h on  uh.id_hotel=h.id_hotel
			where us.usuario_username=@usuario and h.hotel_estado=1
			end
			else select @result=0--usuario multihotel O SIN HOTELES DISPONIBLES
		
		
		return @result

end
go

IF OBJECT_ID ('[NO_TRIGGERS].fn_usuario_tiene_hotel') IS NOT NULL drop function [NO_TRIGGERS].fn_usuario_tiene_hotel
go
-- select [NO_TRIGGERS].fn_get_id_hotel_usuario('admin')
create function [no_triggers].fn_usuario_tiene_hotel (@usuario nvarchar(100))
returns int
as
begin
		declare @result int
		if exists (select 1 from [no_triggers].usuario_por_hotel uh
			join [no_triggers].Usuario us on uh.id_usuario=us.id_usuario
			join [no_triggers].Hotel  h on  uh.id_hotel=h.id_hotel
			where us.usuario_username=@usuario and h.hotel_estado=1)
			begin
			select @result=1
			end
			else select @result=0--usuario SIN HOTELES DISPONIBLES
		
		
		return @result

end
go

IF OBJECT_ID ('[NO_TRIGGERS].fn_get_hotel_nombre') IS NOT NULL drop function [NO_TRIGGERS].fn_get_hotel_nombre
go
-- select [NO_TRIGGERS].fn_get_hotel_nombre(1)
create function [no_triggers].fn_get_hotel_nombre (@hotelid int)
returns nvarchar(100)
as
begin
		declare @result nvarchar(100)
		select @result=hotel_nombre from [no_triggers].hotel h		where id_hotel=@hotelid
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

IF OBJECT_ID ('[NO_TRIGGERS].sp_lista_rol_usuario') IS NOT NULL drop procedure [NO_TRIGGERS].sp_lista_rol_usuario
go
create procedure [NO_TRIGGERS].sp_lista_rol_usuario (@usuario nvarchar(100))
as 
begin
select h.id_rol, h.rol_nombre from [NO_TRIGGERS].rol h
join [NO_TRIGGERS].usuario_roles uh on h.id_rol=uh.id_rol
join [NO_TRIGGERS].Usuario u on uh.id_usuario=u.id_usuario
where usuario_username=@usuario and h.rol_estado=1
end
go

IF OBJECT_ID ('[NO_TRIGGERS].fn_get_usuario_rol_habilitado') IS NOT NULL drop function [NO_TRIGGERS].fn_get_usuario_rol_habilitado
go

create function [NO_TRIGGERS].fn_get_usuario_rol_habilitado
(@usern nvarchar(100)) returns int
	AS 
		begin
	declare @Resultado int
	if exists 
	(select uh.id_rol from [NO_TRIGGERS].usuario_roles uh 
	join [NO_TRIGGERS].rol rl on uh.id_rol=rl.id_rol
	join [NO_TRIGGERS].Usuario u on uh.id_usuario=u.id_usuario
	where u.usuario_username=@usern and rl.rol_estado=1
	--
	)
	begin
	select @Resultado=1
	end else select @resultado=0
	return @resultado
end
GO


IF OBJECT_ID ('[NO_TRIGGERS].sp_set_usuario_rol_asignado','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_set_usuario_rol_asignado
go
create procedure [NO_TRIGGERS].sp_set_usuario_rol_asignado
@id_rol int, @username varchar (100)
	AS
		update [NO_TRIGGERS].Usuario
				set id_rol_asignado=@id_rol
		where usuario_username=@username
	GO


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

/********************MENU PRINCIPAL************************************************************/


IF OBJECT_ID ('[NO_TRIGGERS].fn_abm_Habilitado') IS NOT NULL drop function [NO_TRIGGERS].fn_abm_Habilitado
go

create function [NO_TRIGGERS].fn_abm_Habilitado 
(@user nvarchar(100), @funcionalidad nvarchar (100)) returns bit
	AS
		begin
			declare @Resultado bit
		if exists (select fr.id_funcionalidad from [NO_TRIGGERS].Rol_por_funcionalidad fr 
				join [NO_TRIGGERS].Usuario us on us.id_rol_asignado=fr.id_rol
				join [NO_TRIGGERS].Funcionalidad f on fr.id_funcionalidad=f.id_funcionalidad
				JOIN [NO_TRIGGERS].Rol  RL ON US.id_rol_asignado=RL.id_rol
				where f.funcionalidad_descripcion=@Funcionalidad and us.usuario_username=@user
				AND RL.rol_estado=1)
			set @Resultado=1
		else
			set @Resultado=0
	return @resultado
end
GO
-- select [no_triggers].fn_abm_habilitado ('Admin','Rol')


/***************************************************************************************PARA ROL*******************************************/
/*Se decide que se creen los roles en estado ACTIVO*/

IF OBJECT_ID ('[NO_TRIGGERS].sp_rol_listado','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_rol_listado 
go
create procedure [NO_TRIGGERS].sp_rol_listado 

	AS
select 
rl.id_rol [ID], rol_nombre [Rol Nombre], rol_estado as [Rol Activo]
,isnull(STUFF((SELECT ',' + funcionalidad_descripcion
              from [NO_TRIGGERS].Funcionalidad f2, [NO_TRIGGERS].Rol_por_funcionalidad rf2
              WHERE f2.id_funcionalidad = rf2.id_funcionalidad and rf.id_rol=rf2.id_rol order by funcionalidad_descripcion
              FOR XML PATH (''))
             , 1, 1, ''),'') as [Lista Funcionalidades]
from [NO_TRIGGERS].Rol rl 
left join [NO_TRIGGERS].Rol_por_funcionalidad rf on rl.id_rol=rf.id_rol
left join [NO_TRIGGERS].Funcionalidad f on rf.id_funcionalidad=f.id_funcionalidad
where rl.rol_nombre <>'ADMINISTRADOR'
group by rl.id_rol,rf.id_rol, rol_nombre, rol_estado
GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_lista_fun_act','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_lista_fun_act 
go
create procedure [NO_TRIGGERS].sp_lista_fun_act (@id_rol int) 

	AS
select 
f.id_funcionalidad,f.funcionalidad_descripcion
from [NO_TRIGGERS].Rol_por_funcionalidad rf 
join [NO_TRIGGERS].Funcionalidad f on rf.id_funcionalidad=f.id_funcionalidad
where rf.id_rol=@id_rol
	GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_lista_fun_disp','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_lista_fun_disp
go
create procedure [NO_TRIGGERS].sp_lista_fun_disp (@id_rol int) 

	AS
select 
f.id_funcionalidad,f.funcionalidad_descripcion
from [NO_TRIGGERS].Funcionalidad f 
where f.id_funcionalidad not in (select id_funcionalidad from [NO_TRIGGERS].rol_por_funcionalidad rff where rff.id_rol=@id_rol)
and funcionalidad_descripcion != 'USUARIO'-- REMOVIDO USUARIO DADO QUE NO DEBE SER ASIGNADO A NINGUN ROL
	GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_get_rol_nombre') IS NOT NULL drop function [NO_TRIGGERS].fn_get_rol_nombre
go

create function [NO_TRIGGERS].fn_get_rol_nombre
(@id int) returns nvarchar(100)
	AS 
		begin
	declare @Resultado nvarchar(100)
	select @Resultado=rol_nombre from [NO_TRIGGERS].Rol where id_rol=@id
	return @resultado
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_get_rol_estado') IS NOT NULL drop function [NO_TRIGGERS].fn_get_rol_estado
go

create function [NO_TRIGGERS].fn_get_rol_estado
(@id int) returns int
	AS 
		begin
	declare @Resultado int
	select @Resultado=rol_estado from [NO_TRIGGERS].Rol where id_rol=@id
	return @resultado
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_next_id_rol') IS NOT NULL drop function [NO_TRIGGERS].fn_next_id_rol
go

create function [NO_TRIGGERS].fn_next_id_rol () returns int
	AS 
		begin
	declare @Resultado int
	select @Resultado=max(id_rol) from [NO_TRIGGERS].Rol
	return @resultado
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_nombre_rol_unico') IS NOT NULL drop function [NO_TRIGGERS].fn_nombre_rol_unico
go

create function [NO_TRIGGERS].fn_nombre_rol_unico (@nombre nvarchar (100)) returns int
	AS 
		begin
	declare @Resultado int
	if exists (select 1 from [NO_TRIGGERS].rol where rol_nombre=@nombre) begin

	select @Resultado=0
	end else select @Resultado=1
	return @resultado
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_nombre_rol_unico_upd') IS NOT NULL drop function [NO_TRIGGERS].fn_nombre_rol_unico_upd
go

create function [NO_TRIGGERS].fn_nombre_rol_unico_upd (@nombre nvarchar (100), @idrol int) returns int
	AS 
		begin
	declare @Resultado int
	if exists (select 1 from [NO_TRIGGERS].rol where rol_nombre=@nombre and id_rol <> @idrol) begin
	select @Resultado=0
	end else select @Resultado=1
	return @resultado
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_set_rol_nombre','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_set_rol_nombre
go
create procedure [NO_TRIGGERS].sp_set_rol_nombre 
@id int, @Nombre_rol varchar (100)
	AS
		update [NO_TRIGGERS].Rol
		set rol_nombre=@Nombre_rol
		where id_rol=@id
	GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_set_rol_estado','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_set_rol_estado 
go
create procedure [no_triggers].sp_set_rol_estado
@id_rol int, @estado_modificado int
	AS
	update [NO_TRIGGERS].rol set rol_estado=@estado_modificado
	WHERE @id_rol=id_rol
	GO
--exec [NO_TRIGGERS].sp_rol_set_estado 1,1
GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_rol_crear','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_rol_crear 
go

create procedure [NO_TRIGGERS].sp_rol_crear 
@Nombre_rol varchar (100)
	AS
		insert into 
		[NO_TRIGGERS].rol (rol_nombre,rol_estado) values (@Nombre_rol, 1)

	GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_agrega_funcionalidad','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_agrega_funcionalidad 
go
--select * from [no_triggers].rol
create procedure [NO_TRIGGERS].sp_agrega_funcionalidad
	@Rol_id int, @Funcionalidad int
	AS
	if not exists (select 1 from [NO_TRIGGERS].rol_por_funcionalidad where id_rol=@Rol_id and id_funcionalidad=@Funcionalidad)
	begin
	insert into [NO_TRIGGERS].rol_por_funcionalidad values (@Rol_id,@Funcionalidad)
	end
	GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_quita_funcionalidad','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_quita_funcionalidad 
go

create procedure [NO_TRIGGERS].sp_quita_funcionalidad
@Rol_id int, @Funcionalidad int
	AS
		delete [NO_TRIGGERS].rol_por_funcionalidad where id_funcionalidad=@Funcionalidad and id_rol=@Rol_id
	GO





--select [NO_TRIGGERS].fn_validar_password ('USER_GUEST2', 'user_guest')
--exec [NO_TRIGGERS].sp_Incrementar_Intentos_fallidos'USER_GUEST2'


/***********************PARA USUARIO*************************************/
GO
IF OBJECT_ID ('[NO_TRIGGERS].sp_quita_rol','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_quita_rol
go

create procedure [NO_TRIGGERS].sp_quita_rol
@user_id int, @rol_id int
	AS
		delete [NO_TRIGGERS].usuario_roles where id_usuario=@user_id and id_rol=@Rol_id
	GO
IF OBJECT_ID ('[NO_TRIGGERS].sp_quita_hotel','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_quita_hotel
go

create procedure [NO_TRIGGERS].sp_quita_hotel
@user_id int, @hotel_id int
	AS
		delete [NO_TRIGGERS].usuario_por_hotel where id_usuario=@user_id and id_hotel=@hotel_id
	GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_agrega_urole','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_agrega_urole
go
--select * from [no_triggers].rol
create procedure [NO_TRIGGERS].sp_agrega_urole
	@user_id int, @rol_id int
	AS
	if not exists (select 1 from [NO_TRIGGERS].usuario_roles where id_rol=@Rol_id and id_usuario=@user_id)
	begin
	insert into [NO_TRIGGERS].usuario_roles (id_rol,id_usuario) values (@Rol_id,@user_id)
	end
	GO

IF OBJECT_ID ('[NO_TRIGGERS].sp_agrega_uhotel','P') IS NOT NULL drop procedure [NO_TRIGGERS].sp_agrega_uhotel
go
--select * from [no_triggers].rol
create procedure [NO_TRIGGERS].sp_agrega_uhotel
	@user_id int, @hotel_id int
	AS
	if not exists (select 1 from [NO_TRIGGERS].usuario_por_hotel where id_hotel=@hotel_id and id_usuario=@user_id)
	begin
	insert into [NO_TRIGGERS].usuario_por_hotel(id_hotel,id_usuario) values (@hotel_id,@user_id)
	end
	GO



IF OBJECT_ID ('[NO_TRIGGERS].fn_username_unico') IS NOT NULL drop function [NO_TRIGGERS].fn_username_unico
go

create function [NO_TRIGGERS].fn_username_unico (@username nvarchar (100), @userid int) returns int
	AS 
		begin
	declare @Resultado int
	if exists (select 1 from [NO_TRIGGERS].usuario where usuario_username=@username and id_usuario<>@userid) begin
	
	select @Resultado=0
	end else select @Resultado=1
	return @resultado
end
GO


IF OBJECT_ID ('[NO_TRIGGERS].sp_lis_usuario') IS NOT NULL drop procedure [NO_TRIGGERS].sp_lis_usuario
go
create procedure [NO_TRIGGERS].sp_lis_usuario 
@idUser int
as
	select distinct us.id_usuario, usuario_username as UserName, usuario_nombre as Nombre  
	, usuario_apellido as Apellido, usuario_email as email, usuario_fecha_nacimiento as fecha_nac
	,td.tipo_de_documento_nombre as tipo_doc, usuario_numero_documento as nro_doc, usuario_telefono as telefono, usuario_habilitado
	from [NO_TRIGGERS].Usuario us
	join [NO_TRIGGERS].usuario_por_hotel uh on us.id_usuario=uh.id_usuario
	left join [NO_TRIGGERS].Tipo_documento td on us.id_tipo_documento=td.id_tipo_documento
	where us.id_usuario=@idUser-- and uh.id_hotel in (select uh.id_hotel from [NO_TRIGGERS].usuario_por_hotel where id_usuario=@loggedUser)
go


IF OBJECT_ID ('[NO_TRIGGERS].sp_lis_tipo_DNI') IS NOT NULL drop procedure [NO_TRIGGERS].sp_lis_tipo_DNI
go
create procedure [NO_TRIGGERS].sp_lis_tipo_DNI

as
	select id_tipo_documento,tipo_de_documento_nombre
	from [NO_TRIGGERS].Tipo_documento
go

IF OBJECT_ID ('[NO_TRIGGERS].sp_lis_usu_roles') IS NOT NULL drop procedure [NO_TRIGGERS].sp_lis_usu_roles
go
create procedure [NO_TRIGGERS].sp_lis_usu_roles
@idUser int
as
	select r.id_rol, rol_nombre, rol_estado as rol_activo
	from [NO_TRIGGERS].Rol r
	join [NO_TRIGGERS].usuario_roles ur on r.id_rol=ur.id_rol
	where ur.id_usuario=@idUser
go
--exec [no_triggers].sp_lis_usu_roles 1

IF OBJECT_ID ('[NO_TRIGGERS].sp_lis_usu_id_hotel') IS NOT NULL drop procedure [NO_TRIGGERS].sp_lis_usu_id_hotel
go
create procedure [NO_TRIGGERS].sp_lis_usu_id_hotel (@idUser int)
as 
begin
select h.id_hotel,hotel_nombre, hotel_estado  from [NO_TRIGGERS].hotel h
join [NO_TRIGGERS].usuario_por_hotel uh on h.id_hotel=uh.id_hotel
where uh.id_usuario=@idUser
end
go
--exec [no_triggers].sp_lis_usu_id_hotel 1

IF OBJECT_ID ('[NO_TRIGGERS].sp_lis_u_roles_libres') IS NOT NULL drop procedure [NO_TRIGGERS].sp_lis_u_roles_libres
go
create procedure [NO_TRIGGERS].sp_lis_u_roles_libres
@idUser int
as
	select r.id_rol, rol_nombre	from [NO_TRIGGERS].Rol r
	where id_rol not in (select id_rol from [NO_TRIGGERS].usuario_roles ur	where ur.id_usuario=@idUser) and rol_estado=1
go
--exec [no_triggers].sp_lis_u_roles_libres 2

IF OBJECT_ID ('[NO_TRIGGERS].sp_lis_u_hotel_libres') IS NOT NULL drop procedure [NO_TRIGGERS].sp_lis_u_hotel_libres
go
create procedure [NO_TRIGGERS].sp_lis_u_hotel_libres (@idUser int)
as 
begin
select h.id_hotel,hotel_nombre, hotel_estado  from [NO_TRIGGERS].hotel h
where id_hotel not in (select id_hotel from [NO_TRIGGERS].usuario_por_hotel uh where uh.id_usuario=@idUser) and hotel_estado=1
end
go
-- exec [NO_TRIGGERS].sp_lis_u_hotel_libres 2
--getters and setters de variables: username, nombre, apellido, contraseña (solo set), email, fechaNAC,tipoDoc,nroDoc
--Setters:
IF OBJECT_ID ('[NO_TRIGGERS].sp_set_usuario_datos') IS NOT NULL drop procedure [NO_TRIGGERS].sp_set_usuario_datos
go
create procedure [NO_TRIGGERS].sp_set_usuario_datos (@idUser int, @usern nvarchar(100), @nombre nvarchar(100), @apell nvarchar(100), @email nvarchar(100), @fechanac nvarchar(100), @tipoD int, @ndoc int, @ntel int)
as 
begin
update u
set 
u.usuario_username=@usern,
u.usuario_nombre=@nombre,
u.usuario_apellido=@apell,
u.usuario_email=@email,
u.usuario_fecha_nacimiento= CONVERT(date,@fechanac,103),
u.id_tipo_documento=@tipoD,
u.usuario_numero_documento=@ndoc,
u.usuario_telefono=@ntel
from [NO_TRIGGERS].Usuario U
where u.id_usuario=@idUser
end
go

IF OBJECT_ID ('[NO_TRIGGERS].sp_crear_usuario') IS NOT NULL drop procedure [NO_TRIGGERS].sp_crear_usuario
go

create procedure [NO_TRIGGERS].sp_crear_usuario --se decide que el usuario quede habilitado al crearse--
@uname nvarchar(100), @nombre nvarchar(200), @apellido nvarchar(100), @pass nvarchar(100), @email nvarchar(200), @fechanac nvarchar(20), @tipodoc int, @n_doc nvarchar(50), @ntel nvarchar(50)
AS
BEGIN
DECLARE @responseMessage nvarchar(250) 
	SET NOCOUNT ON 

		INSERT INTO [NO_TRIGGERS].Usuario 
		(usuario_username,usuario_nombre,usuario_apellido,usuario_password,usuario_email,usuario_fecha_nacimiento,usuario_cantidad_intentos_fallidos
		,id_tipo_documento,usuario_numero_documento,usuario_telefono,usuario_habilitado	)
		VALUES (@uname, @nombre, @apellido, [NO_TRIGGERS].fn_encriptar(@pass), @email, CONVERT(date,@fechanac,103), 0,@tipodoc, @n_doc, @ntel,1)
END
go


IF OBJECT_ID ('[NO_TRIGGERS].sp_user_Set_pass') IS NOT NULL drop procedure [NO_TRIGGERS].sp_user_Set_pass
go

create proc [NO_TRIGGERS].sp_user_Set_pass
@userID int, @pass nvarchar(256)
as
begin
	update [NO_TRIGGERS].Usuario 
	set usuario_password = [NO_TRIGGERS].fn_encriptar(@pass) where id_usuario = @userID
end
go

--exec [NO_TRIGGERS].sp_Cambiar_Contraseña 'USER_GUEST2', 'pepita'

IF OBJECT_ID ('[NO_TRIGGERS].sp_Dar_Baja_Usuario') IS NOT NULL drop procedure [NO_TRIGGERS].sp_Dar_Baja_Usuario
go
create proc [NO_TRIGGERS].sp_Dar_Baja_Usuario
@idUser int
as
				update [NO_TRIGGERS].Usuario
				set usuario_habilitado = 0 where id_usuario=@idUser
go

IF OBJECT_ID ('[NO_TRIGGERS].sp_set_user_estado') IS NOT NULL drop procedure [NO_TRIGGERS].sp_set_user_estado
go
create proc [NO_TRIGGERS].sp_set_user_estado
@idUser int,@estado int
as
				update [NO_TRIGGERS].Usuario
				set usuario_habilitado = @estado where id_usuario=@idUser
go




IF OBJECT_ID ('[NO_TRIGGERS].fn_get_username') IS NOT NULL drop function [NO_TRIGGERS].fn_get_username
go

create function [NO_TRIGGERS].fn_get_username
(@id int) returns nvarchar(100)
	AS 
		begin
	declare @Resultado nvarchar(100)
	select @Resultado=usuario_username from [NO_TRIGGERS].usuario where id_usuario=@id
	return @resultado
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_get_usuario_nombre') IS NOT NULL drop function [NO_TRIGGERS].fn_get_usuario_nombre
go

create function [NO_TRIGGERS].fn_get_usuario_nombre
(@id int) returns nvarchar(100)
	AS 
		begin
	declare @Resultado nvarchar(100)
	select @Resultado=usuario_nombre from [NO_TRIGGERS].usuario where id_usuario=@id
	return @resultado
end
GO
IF OBJECT_ID ('[NO_TRIGGERS].fn_get_usuario_apellido') IS NOT NULL drop function [NO_TRIGGERS].fn_get_usuario_apellido
go

create function [NO_TRIGGERS].fn_get_usuario_apellido
(@id int) returns nvarchar(100)
	AS 
		begin
	declare @Resultado nvarchar(100)
	select @Resultado=usuario_apellido from [NO_TRIGGERS].usuario where id_usuario=@id
	return @resultado
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_get_user_mail') IS NOT NULL drop function [NO_TRIGGERS].fn_get_user_mail
go

create function [NO_TRIGGERS].fn_get_user_mail
(@id int) returns nvarchar(200)
	AS 
		begin
	declare @Resultado nvarchar(200)
	select @Resultado=usuario_email from [NO_TRIGGERS].usuario where id_usuario=@id
	return @resultado
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_get_user_fechanac') IS NOT NULL drop function [NO_TRIGGERS].fn_get_user_fechanac
go

create function [NO_TRIGGERS].fn_get_user_fechanac
(@id int) returns nvarchar(100)
	AS 
		begin
	declare @Resultado nvarchar(100)
	select @Resultado=
	CONVERT(nvarchar(100),usuario_fecha_nacimiento,103) from [NO_TRIGGERS].usuario where id_usuario=@id
	return @resultado
end
GO
--select [NO_TRIGGERS].fn_get_user_fechanac(1)
IF OBJECT_ID ('[NO_TRIGGERS].fn_get_user_dni') IS NOT NULL drop function [NO_TRIGGERS].fn_get_user_dni
go

create function [NO_TRIGGERS].fn_get_user_dni
(@id int) returns nvarchar(100)
	AS 
		begin
	declare @Resultado nvarchar(100)
	select @Resultado=convert(nvarchar(100),usuario_numero_documento) from [NO_TRIGGERS].usuario where id_usuario=@id
	return @resultado
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_get_user_phone') IS NOT NULL drop function [NO_TRIGGERS].fn_get_user_phone
go

create function [NO_TRIGGERS].fn_get_user_phone
(@id int) returns nvarchar(100)
	AS 
		begin
	declare @Resultado nvarchar(100)
	select @Resultado=convert(nvarchar(100),usuario_telefono) from [NO_TRIGGERS].usuario where id_usuario=@id
	return @resultado
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_get_usrid_f_username') IS NOT NULL drop function [NO_TRIGGERS].fn_get_usrid_f_username
go

create function [NO_TRIGGERS].fn_get_usrid_f_username
(@uname nvarchar(100)) returns int
	AS 
		begin
	declare @Resultado int
	select @Resultado=id_usuario from [NO_TRIGGERS].usuario where usuario_username=@uname
	return @resultado
end
GO

IF OBJECT_ID ('[NO_TRIGGERS].fn_get_user_active') IS NOT NULL drop function [NO_TRIGGERS].fn_get_user_active
go

create function [NO_TRIGGERS].fn_get_user_active
(@id int) returns int
	AS 
		begin
	declare @Resultado int
	select @Resultado=usuario_habilitado from [NO_TRIGGERS].usuario where id_usuario=@id
	return @resultado
end
GO
--select [NO_TRIGGERS].fn_get_user_active(1)
IF OBJECT_ID ('[NO_TRIGGERS].fn_get_user_tipoDocID') IS NOT NULL drop function [NO_TRIGGERS].fn_get_user_tipoDocID
go

create function [NO_TRIGGERS].fn_get_user_tipoDocID
(@id int) returns int
	AS 
		begin
	declare @Resultado int
	select @Resultado=id_tipo_documento from [NO_TRIGGERS].usuario where id_usuario=@id
	return @resultado
end
GO


--select CONVERT(date,'09/07/2017',103)
-- populadores de tablas de mapeo de roles y hoteles.

/*************************PAIS- CIUDAD - DIRECCION*************************************************/
go

IF OBJECT_ID ('[NO_TRIGGERS].sp_add_ciudad') IS NOT NULL drop procedure [NO_TRIGGERS].sp_add_ciudad
go

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
IF OBJECT_ID ('[NO_TRIGGERS].sp_add_direccion') IS NOT NULL drop procedure [NO_TRIGGERS].sp_add_direccion
go

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

IF OBJECT_ID ('[NO_TRIGGERS].fn_cliente_habilitado') IS NOT NULL drop function [NO_TRIGGERS].fn_cliente_habilitado
go

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
	if((select id_rol_asignado from [NO_TRIGGERS].Usuario us where us.usuario_username=@nombreAdministrador and us.usuario_email=@email and us.usuario_telefono=@telefono)=3)
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


/**

VISTAS 


**/
if object_id('[no_triggers].view_usuario') is not null drop view [NO_TRIGGERS].view_usuario
go
create view [no_triggers].view_usuario
as

select distinct u.* from [NO_TRIGGERS].Usuario u
join [NO_TRIGGERS].usuario_por_Hotel h on u.id_usuario=h.id_usuario 
where h.id_hotel in (select usuario_hotel_logueado from [NO_TRIGGERS].usuario)

go