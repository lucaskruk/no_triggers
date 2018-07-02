
--------------------------------------------------------------------------------------------------------------------------
-------------------------------- Migracion De datos-----------------------------------------------------------------------
-- Funcionalidad
truncate table [NO_TRIGGERS].funcionalidad
insert into [NO_TRIGGERS].funcionalidad (funcionalidad_descripcion)
values
	('ROL'),--1----------Exclusivo Administrador
	('USUARIO'),--2 ----------Exclusivo Administrador
	('HOTEL'),--3 -- Administrador
	('HABITACION'),--4 --Administrador
	('REGIMEN'),--5 --Administrador
	('LISTADO'),--6 -- Administrador
	('CLIENTE'),-----7 Recepcionista
	('ESTADIA'),--8 --Recepcionista
	('CONSUMIBLE'),--9 --Recepcionista
	('FACTURAR'),--10 -- Recepcionista
	('RESERVA')--11 --Recepcionista/Guest
--	,('LOGIN y SEGURIDAD')--13
go

--Rol
truncate table [NO_TRIGGERS].rol
insert into [NO_TRIGGERS].rol (rol_nombre,rol_estado)
values 
    ('ADMINISTRADOR', 1),--1
	('RECEPCIONISTA', 1),--2
    ('GUEST', 1)--3

	

go

--Rol x Funcionalidad
truncate table [NO_TRIGGERS].rol_por_funcionalidad
insert into [NO_TRIGGERS].rol_por_funcionalidad (id_rol,id_funcionalidad)
values
	(1,1),--administrador / Rol
	(1,2),--administrador /abm usuario
	(1,3),--administrador / abm hotel
	(1,4),--admin /abm habitacion
	(1,5),--admin / abm regimen
	(1,6),--administrador / listado estadistico
	(1,7),--Admin / abm cliente
	(1,8),--Admin / abm Estadia
	(1,9),--Admin / abm Consumibles
	(1,10),--Admin / abm Facturar
	(1,11),--Admin / Reserva
	(2,7),--Recepcion / abm Cliente
	(2,8),--Recepcion / abm Estadia
	(2,9),--Recepcion / Consumibles
	(2,10), --Recepcion / Facturar
	(2,11), -- Recepcion / Reserva
	(3,11) -- Guest / Reserva
go

--estado reserva
truncate table [NO_TRIGGERS].estado_reserva
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
truncate table [NO_TRIGGERS].metodo_de_pago
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
truncate table [NO_TRIGGERS].tipo_documento
insert into [NO_TRIGGERS].tipo_documento (tipo_de_documento_nombre) values 
('D.N.I.'),('Pasaporte')

--PAIS
truncate table [NO_TRIGGERS].[pais]
INSERT INTO [NO_TRIGGERS].[pais] ([pais_nombre],pais_nacionalidad) values
	('Argentina','ARGENTINO'),('Brasil','BRASILERO'),('Uruguay','URUGUAYO'),('Indefinido','Indefinido');
--select * from [no_triggers].pais

truncate table [NO_TRIGGERS].usuario
insert into [NO_TRIGGERS].usuario (usuario_username,usuario_nombre,usuario_apellido,usuario_password,usuario_email,usuario_fecha_nacimiento,usuario_cantidad_intentos_fallidos,id_tipo_documento,usuario_numero_documento,usuario_telefono,usuario_habilitado,id_rol)
values
('Admin','Administrador','General',[NO_TRIGGERS].fn_encriptar('w23e'),'admin@frbahotel.com',getdate(),0,1,'455','999999',1,1),
('Recep','Recepcionista','Hotel1',[NO_TRIGGERS].fn_encriptar('recep1'),'recepcion@frbahotel.com',getdate(),0,1,'455','999999',1,2),
('GUEST', 'User','Generico', [NO_TRIGGERS].fn_encriptar('user_guest'),null,getdate(),0,null,null,null,1,3)
GO


--select * from [no_triggers].usuario_por_hotel
truncate table [NO_TRIGGERS].usuario_por_hotel
INSERT INTO [NO_TRIGGERS].usuario_por_hotel
VALUES 
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,13),
(1,14),
(1,15),
(2,1),
(3,1),
(3,2),
(3,3),
(3,4),
(3,5),
(3,6),
(3,7),
(3,8),
(3,9),
(3,10),
(3,11),
(3,12),
(3,13),
(3,14),
(3,15)

--CIUDAD------------------------11
truncate table [no_triggers].ciudad
insert into [no_triggers].ciudad (id_pais,ciudad_nombre)
select distinct 
(select id_pais from [NO_TRIGGERS].pais where pais_nombre='Argentina'),
Hotel_Ciudad from gd_esquema.Maestra
insert into [no_triggers].ciudad (id_pais,ciudad_nombre)
select id_pais, 'Indefinida' as ciudad_nombre from [NO_TRIGGERS].pais where pais_nombre='Indefinido'
--select * from [no_triggers].ciudad

--Direccion--------------------96958 (96943 + 15)
truncate table [NO_TRIGGERS].direccion
insert into [NO_TRIGGERS].direccion (direccion_calle,direccion_altura,direccion_piso,direccion_departamento, id_ciudad)
select distinct hotel_calle, hotel_nro_calle, null, null, cd.id_ciudad from gd_esquema.Maestra mr 
join [NO_TRIGGERS].ciudad cd on mr.Hotel_Ciudad=cd.ciudad_nombre
union 
select distinct 
cliente_dom_calle, Cliente_Nro_Calle, Cliente_Piso, Cliente_Depto,  (select id_ciudad from [NO_TRIGGERS].ciudad where ciudad_nombre='Indefinida')
from gd_esquema.Maestra

--select * from [no_triggers].direccion

-- Hotel  ---- 15
truncate table [NO_TRIGGERS].hotel
insert into [NO_TRIGGERS].hotel(id_direccion,hotel_cantidad_estrellas,hotel_recarga_estrella,hotel_fecha_creacion,hotel_estado)
select distinct dr.id_direccion, mr.Hotel_CantEstrella,mr.Hotel_Recarga_Estrella, getdate(),1
from gd_esquema.Maestra mr
join [NO_TRIGGERS].ciudad cd on mr.Hotel_Ciudad=cd.ciudad_nombre
join [NO_TRIGGERS].direccion dr on mr.Hotel_Calle=dr.direccion_calle and cd.id_ciudad=dr.id_ciudad and mr.Hotel_Nro_Calle=dr.direccion_altura
update [NO_TRIGGERS].Hotel 
set hotel_nombre= 'Hotel ' + convert(nvarchar,id_hotel)
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
insert into [NO_TRIGGERS].tipoDeHabitacion (tipo_habitacion_porcentual,tipo_habitacion_codigo)
select distinct 
	Habitacion_Tipo_Porcentual,
	Habitacion_Tipo_Codigo
from gd_esquema.Maestra
--select * from [NO_TRIGGERS].tipoDeHabitacion
go

--Habitacion -----------------------------  332
insert into [NO_TRIGGERS].habitacion (habitacion_numero,habitacion_piso,habitacion_frente,Id_tipo_habitacion,habitacion_detalle,id_hotel)
select distinct 
	Habitacion_Numero,
	Habitacion_Piso,
	Habitacion_Frente,
	th.id_tipo_habitacion,
	Habitacion_Tipo_Descripcion,
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