--Migracion de datos--

--PAIS
INSERT INTO [NO_TRIGGERS].[pais] ([pais_nombre],pais_nacionalidad) values
('Argentina','Argentino'),('Brasil','Brasilero'),('Uruguay','Uruguayo'),('Indefinido','Indefinido');

--CIUDAD
--select * from [no_triggers].pais

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
set email_invalido=1
from [NO_TRIGGERS].cliente cl 
join #bad_emails be on cl.cliente_email=be.cliente_email

drop table #bad_emails


