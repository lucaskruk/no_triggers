--Migracion de datos--

--/Rol-----------------------------------------------------------------
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

insert into [NO_TRIGGERS].rol_x_funcionalidad
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

insert into [NO_TRIGGERS].tipo_documento
values 
	('DNI'),
	('PASAPORTE'),
	('LICENCIA DE CONDUCIR')
go



	








