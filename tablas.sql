use GD1C2018
go

IF OBJECT_ID('[no_triggers].pais', 'U') IS NOT NULL 
  DROP TABLE [no_triggers].pais;

create table [no_triggers].pais
(id_pais int identity(1,1) primary key not null,
pais_nombre nvarchar(40),
nacionalidad_nombre nvarchar(80)
)

IF OBJECT_ID('[no_triggers].ciudad', 'U') IS NOT NULL 
  DROP TABLE [no_triggers].ciudad;

create table [no_triggers].ciudad
(id_ciudad int identity(1,1) primary key not null,
id_pais int,
constraint fk_pais_id_pais foreign key (id_pais) references [no_triggers].pais(id_pais)
,ciudad_nombre nvarchar(80));

IF OBJECT_ID('[no_triggers].direccion', 'U') IS NOT NULL 
  DROP TABLE [no_triggers].direccion;

create table [no_triggers].direccion
(id_direccion int identity(1,1) primary key not null,
direccion_calle nvarchar(200),
direccion_altura int,
direccion_piso int,
direccion_departamento nvarchar(4),
id_ciudad int,
constraint fk_ciudad_id foreign key (id_ciudad) references [no_triggers].ciudad(id_ciudad)
)



