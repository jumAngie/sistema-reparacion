Create DataBase BD_Reparaciones 
go
use BD_Reparaciones




Create table tbl_EstadoCivil
(
 EstadoCivil_ID                     char,
 EstadoCivil_Descripcion            nvarchar(150), 
 EstadoCivil_UsuarioCreacionID      int,
 EstadoCivil_FechaCreacion			DATE NOT NULL,
 EstadoCivil_UsuarioModificacionId	INT,
 EstadoCivil_FechaModificacion		DATE
 constraint tbl_EstadoCivil_Id_EstadoCivil  primary key(EstadoCivil_ID)
 --CONSTRAINT PK_UsuarioCreacionID_tbl_usuario_id_usuarios FOREIGN KEY  (UsuarioCreacionID)  REFERENCES tbl_Usuarios(Usuario_UsuarioId),
 --CONSTRAINT PK_UsuarioModificacion_usuario_id_usuarios FOREIGN KEY  (UsuarioModificacionID)  REFERENCES tbl_Usuarios(Usuario_UsuarioId), 
)


INSERT INTO tbl_EstadoCivil
VALUES ('c','Casado',1,GETDATE(),NULL,NULL),
       ('s','Soltero',1,GETDATE(),NULL,NULL),
	   ('v','Viudo',1,GETDATE(),NULL,NULL),
	   ('u','Union Libre',1,GETDATE(),NULL,NULL),
	   ('d','Divorciado',1,GETDATE(),NULL,NULL)


Create table tbl_Departamentos
(
    Departamento_ID             int identity(1,1),
    Departamento_Descripcion    nvarchar(150),
	UsuarioCreacionID    		INT NOT NULL,
	Depto_FechaCreacion			DATE NOT NULL,
	Depto_UsuarioModificacionId	INT,
	Depto_FechaModificacion		DATE
	CONSTRAINT PK_db_tblDepartamentos_Depto_DepartamentoId PRIMARY KEY(Departamento_ID)
 --    CONSTRAINT PK_UsuarioDepartamento_tbl_usuario_id_usuarios FOREIGN KEY  (UsuarioCreacionID)  REFERENCES tbl_Usuarios(Usuario_UsuarioId),
 --CONSTRAINT PK_UsuarioModificacion_usuario_id_usuarios FOREIGN KEY  (Depto_UsuarioModificacionId)  REFERENCES tbl_Usuarios(Usuario_UsuarioId), 
)
  



Insert into tbl_Departamentos
values ('Yoro',1,GETDATE(),NULL,NULL),
       ('Cortez',1,GETDATE(),NULL,NULL),
	   ('Atlantida',1,GETDATE(),NULL,NULL),
	   ('Copan',1,GETDATE(),NULL,NULL),
	   ('Olancho',1,GETDATE(),NULL,NULL),
	   ('Francisco Morazan',1,GETDATE(),NULL,NULL),
	   ('La Paz',1,GETDATE(),NULL,NULL),
	   ('El Paraiso',1,GETDATE(),NULL,NULL),
	   ('Gracias a Dios',1,GETDATE(),NULL,NULL),
	   ('Colon',1,GETDATE(),NULL,NULL)

CREATE TABLE tbl_Ciudades(
	Ciudad_Id				INT identity(1,1),
	Ciudad_Descripcion				NVARCHAR(255) NOT NULL,
	Ciudad_DepartamentoId			INT NOT NULL,
	Ciudad_UsuarioCreacionId		INT NOT NULL,
	Ciudad_FechaCreacion			DATE NOT NULL,
	Ciudad_UsuarioModificacionId	INT,
	Ciudad_FechaModificacion		DATE 
	CONSTRAINT PK_db_tblCiudades_Ciu_CiudadId PRIMARY KEY(Ciudad_Id),
	CONSTRAINT FK_db_tblCiudades_db_tblDepartamentos_Depto_DepartamentoId FOREIGN KEY(Ciudad_DepartamentoId) REFERENCES tbl_Departamentos(Departamento_ID),
 --   CONSTRAINT PK_UsuarioCreacionID_tbl_usuario_id_usuarios FOREIGN KEY(Ciudad_UsuarioCreacionId)  REFERENCES tbl_Usuarios(Usuario_UsuarioId),
 --CONSTRAINT PK_UsuarioModificacion_usuario_id_usuarios FOREIGN KEY  (Ciudad_UsuarioModificacionId)  REFERENCES tbl_Usuarios(Usuario_UsuarioId), 
);

INSERT INTO tbl_Ciudades
VALUES ('El Progreso',1,1,GETDATE(),NULL,NULL),
       ('San Pedro Sula',2,1,GETDATE(),NULL,NULL),
	   ('La Ceiba',3,1,GETDATE(),NULL,NULL),
	   ('Copan',4,1,GETDATE(),NULL,NULL),
	   ('Olancho',5,1,GETDATE(),NULL,NULL),
	   ('Tegucigalpa',6,1,GETDATE(),NULL,NULL),
	   ('La Paz',7,1,GETDATE(),NULL,NULL),
	   ('Danli',8,1,GETDATE(),NULL,NULL),
	   ('Puerto Lempira',9,1,GETDATE(),NULL,NULL),
	   ('Trujillo',10,1,GETDATE(),NULL,NULL)

CREATE TABLE tbl_Empleados(
	Empleado_Id				        INT IDENTITY(1,1),
	Empleado_Nombre			        NVARCHAR(255)NOT NULL,
	Empleado_Apellido		        NVARCHAR(255)NOT NULL,
	Empleado_Identidad				NVARCHAR(30) NOT NULL,
	Empleado_EstadoCivilId			CHAR NOT NULL,
	Empleado_Genero					CHAR(1) NOT NULL,
	Empleado_Telefono				NVARCHAR(15) NOT NULL,
	Empleado_CiudadId				INT NOT NULL,		
	Empleado_Puesto                 Nvarchar(250),
	Empleado_UsuarioCreacionId		INT NOT NULL,
	Empleado_FechaCreacion			DATE NOT NULL,
	Empleado_UsuarioModificacionId	INT,
	Empleado_FechaModificacion		DATE,
	Empleado_Estado					BIT NOT NULL,
	CONSTRAINT PK_db_tblEmpleados_Emp_EmpleadoId PRIMARY KEY(Empleado_Id),
	CONSTRAINT FK_db_tblEmpleados_db_tblEstadoCivil_Est_EstadoCivilId FOREIGN KEY(Empleado_EstadoCivilId) REFERENCES tbl_EstadoCivil(EstadoCivil_Id),
	CONSTRAINT FK_db_tblEmpleados_db_tblCiudades_Ciu_CiudadId FOREIGN KEY(Empleado_CiudadId) REFERENCES tbl_Ciudades(Ciudad_Id),
	CONSTRAINT UQ_db_tblEmpleados_Emp_Identidad UNIQUE(Empleado_Identidad),
	CONSTRAINT CK_db_tblEmpleados_Emp_Genero CHECK(Empleado_Genero IN('F','M')),
);



INSERT INTO tbl_Empleados
VALUES ('Diego','Portillo','1804-2005-05689','S','M','9485-6525',1,'Supervisor',1,GETDATE(),NULL,NULL,1),
       ('Alberto','Escobar','1804-2001-05484','S','M','9485-6525',2,'Tecnico',1,GETDATE(),NULL,NULL,1),
	   ('Elizabet','Portillo','1804-2002-06855','S','F','9485-6525',3,'Tecnico',1,GETDATE(),NULL,NULL,1),
	   ('Maria','Escobar','1804-2003-00059','S','F','9485-6525',4,'Tecnico',1,GETDATE(),NULL,NULL,1),
	   ('Juan','Centeno','1804-2004-01458','S','M','9485-6525',5,'Tecnico',1,GETDATE(),NULL,NULL,1),
	   ('Ian','Hernandez','1804-2004-00256','S','M','9485-6525',6,'Tecnico',1,GETDATE(),NULL,NULL,1),
	   ('Giovanny','Hernandez','1801-2005-00558','S','M','9485-6525',7,'Tecnico',1,GETDATE(),NULL,NULL,1),
	   ('Antonio','Torrez','1804-1999-00010','S','M','9485-6525',8,'Tecnico',1,GETDATE(),NULL,NULL,1),
	   ('Angel','Guillen','1804-2002-02568','S','M','9485-6525',10,'Tecnico',1,GETDATE(),NULL,NULL,1),
	   ('Esdra','Cerna','1804-2006-01025','S','F','9485-6525',1,'Tecnico',1,GETDATE(),NULL,NULL,1)

	CREATE TABLE tbl_Usuarios(
	Usuario_UsuarioId				INT IDENTITY(1,1),
	Usuario_Usuario					NVARCHAR(255) NOT NULL,
	Usuario_Empleado				INT NOT NULL,
	Usuario_Password				NVARCHAR(MAX) NOT NULL,
	Usuario_UsuarioCreacionId		INT NOT NULL, 
	Usuario_FechaCreacion			DATE NOT NULL,
	Usuario_UsuarioModificacionId	INT,
	Usuario_FechaModificacion		DATE,
	Usuario_UsuarioAdmin			BIT,
	Usuario_Estado					BIT NOT NULL
	CONSTRAINT UQ_db_tblUsuarios_Usu_Usuario UNIQUE(Usuario_Usuario),
    CONSTRAINT PK_UsuarioID_TblUSARIO PRIMARY KEY(Usuario_UsuarioId),
	CONSTRAINT FK_tblUsuarios_Usuario_Empleado_tblEmpleado_empleadoID FOREIGN KEY (Usuario_Empleado) REFERENCES tbl_Empleados (empleado_ID)
)


select HASHBYTES('SHA2_512','julian10')
--Admin  Admin123
--Julian  julian10



Insert into [dbo].[tbl_Usuarios]
values('Admin',1,'0x7FCF4BA391C48784EDDE599889D6E3F1E47A27DB36ECC050CC92F259BFAC38AFAD2C68A1AE804D77075E8FB722503F3ECA2B2C1006EE6F6C7B7628CB45FFFD1D',1,getdate(),null,null,1,1),
      ('Julian',2,'0xD4CE77C436C90A1A11F936EDCA5920A5C9CC94D19B0B3925203D8726AB0F1165FA8739F3F388222725528E4AF090FDD775E24B7080C413520305119CB2B9FE26',1,getdate(),null,null,1,1)



CREATE TABLE tbl_Cliente(
	Cliente_Id				        INT IDENTITY(1,1),
	Cliente_Nombre			        NVARCHAR(255)NOT NULL,
	Cliente_Apellido		        NVARCHAR(255)NOT NULL,
	Cliente_Identidad				NVARCHAR(30) NOT NULL,
	Cliente_EstadoCivilId			CHAR NOT NULL,
	Cliente_Genero					CHAR(1) NOT NULL,
	Cliente_Telefono				NVARCHAR(15) NOT NULL,
	Cliente_CiudadId				INT NOT NULL,			                
	Cliente_UsuarioCreacionId		INT NOT NULL,
	Cliente_FechaCreacion			DATE NOT NULL,
	Cliente_UsuarioModificacionId	INT,
	Cliente_FechaModificacion		DATE,
	Cliente_Estado					BIT NOT NULL,
	CONSTRAINT PK_db_tblCliente_Emp_EmpleadoId PRIMARY KEY(Cliente_Id),
	CONSTRAINT FK_db_tblCliente_db_tblEstadoCivil_Est_EstadoCivilId FOREIGN KEY(Cliente_EstadoCivilId) REFERENCES tbl_EstadoCivil(EstadoCivil_Id),
	CONSTRAINT FK_db_tblCliente_db_tblCiudades_Ciu_CiudadId FOREIGN KEY(Cliente_CiudadId) REFERENCES tbl_Ciudades(Ciudad_Id),
	CONSTRAINT UQ_db_tblCliente_Emp_Identidad UNIQUE(Cliente_Identidad),
	CONSTRAINT CK_db_tblCliente_Emp_Genero CHECK(Cliente_Genero IN('F','M')),
);






INSERT INTO tbl_Cliente
VALUES ('Josue','Portillo','1804-2005-05689','S','M','9485-6525',1,1,GETDATE(),NULL,NULL,1),
       ('Gilberto','Escobar','1804-2001-05484','S','M','9485-6525',2,1,GETDATE(),NULL,NULL,1),
	   ('lizbet','Portillo','1804-2002-06855','S','F','9485-6525',3,1,GETDATE(),NULL,NULL,1),
	   ('Marisol','Escobar','1804-2003-00059','S','F','9485-6525',4,1,GETDATE(),NULL,NULL,1),
	   ('John','Centeno','1804-2004-01458','S','M','9485-6525',5,1,GETDATE(),NULL,NULL,1),
	   ('Miguel','Hernandez','1804-2004-00256','S','M','9485-6525',6,1,GETDATE(),NULL,NULL,1),
	   ('Diego','Hernandez','1801-2005-00558','S','M','9485-6525',7,1,GETDATE(),NULL,NULL,1),
	   ('Bertho','Torrez','1804-1999-00010','S','M','9485-6525',8,1,GETDATE(),NULL,NULL,1),
	   ('Anael','Guillen','1804-2002-02568','S','M','9485-6525',10,1,GETDATE(),NULL,NULL,1),
	   ('Esdra','Cerna','1804-2006-01025','S','F','9485-6525',1,1,GETDATE(),NULL,NULL,1)

CREATE TABLE tbl_TipoDeTrabajo(
		
		tipo_ID					INT IDENTITY(1,1)	NOT NULL,
		tipo_Descripción		NVARCHAR(40)		NOT NULL,
		UsuarioCreacion			INT					NOT NULL,
		UsuarioModificacion		INT,
		FechaCreacion			DATETIME			NOT NULL,
		FechaModificacion		DATETIME,
		Estado					BIT					NOT NULL,
		Accion					VARCHAR(1)			NOT NULL

		CONSTRAINT PK_tblTipoDeTrabajo_tipo_ID PRIMARY KEY (tipo_ID)
);

INSERT INTO tbl_TipoDeTrabajo
VALUES('Mantenimiento',1,null,GEtdate(),null,1,'C'),
      ('Diagnostico',1,null,GEtdate(),null,1,'C'),
	  ('Reparacion',1,null,GEtdate(),null,1,'C')




CREATE TABLE tbl_Producto(
		
		pro_ID				INT IDENTITY (1,1)		NOT NULL,
		pro_Descripción		NVARCHAR(MAX)			NOT NULL, 
		pro_FechaIngreso	    DATETIME			NOT NULL,		
		UsuarioCreacion			INT					NOT NULL,
		UsuarioModificacion		INT,
		FechaCreacion			DATETIME			NOT NULL,
		FechaModificacion		DATETIME			,
		Estado					BIT					NOT NULL,
		Accion					VARCHAR(1)			NOT NULL

  		CONSTRAINT PK_tblProducto_pro_ID PRIMARY KEY (pro_ID)      
);



CREATE TABLE tbl_Reparación(

		rep_ID					INT IDENTITY(1,1)		NOT NULL,
		rep_TipodeTrabajo		INT						NOT NULL,
		rep_Producto			INT						NOT NULL,
		rep_Cliente				INT						NOT NULL,
		rep_Empleado			INT						NOT NULL,
		rep_EstadoReparacion	NVARCHAR(MAX)			NOT NULL,
		UsuarioCreacion			INT					NOT NULL,
		UsuarioModificacion		INT,
		FechaCreacion			DATETIME			NOT NULL,
		FechaModificacion		DATETIME			,
		Estado					BIT					NOT NULL,
		Accion					VARCHAR(1)			NOT NULL

		CONSTRAINT PK_tblReparación_rep_ID                                          PRIMARY KEY (rep_ID),
		CONSTRAINT FK_tblReparación_rep_TipodeTrabajo_tblTipoDeTrabajo_tipo_ID      FOREIGN KEY (rep_TipodeTrabajo) REFERENCES tbl_TipoDeTrabajo (tipo_ID),
		CONSTRAINT FK_tblReparación_rep_Producto_tblProducto_pro_ID                 FOREIGN KEY (rep_Producto) REFERENCES tbl_Producto (pro_ID),
		CONSTRAINT FK_tblReparacion_rep_Empleado_tbl_Empleado_Empleado_id           FOREIGN KEY (rep_Empleado) REFERENCES tbl_Empleados(Empleado_id),
        CONSTRAINT FK_tBLReparacion_rep_Cliente_tbl_Cliente_cliente_id              FOREIGN KEY (rep_Cliente)  REFERENCES tbl_Cliente(Cliente_Id)
);


