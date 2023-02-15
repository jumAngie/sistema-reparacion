
------------ alter tabla estado civil  -------------
ALTER TABLE tbl_EstadoCivil
ADD Estado BIT
DEFAULT NULL;

ALTER TABLE tbl_EstadoCivil
ADD Accion VARCHAR(1)
DEFAULT NULL;

UPDATE	[dbo].[tbl_EstadoCivil]
SET		[Accion] = 'C' , [Estado] = 1


------------------------------------------------------------ CIUDADES ---------------------------------------------------

-- udp para mostrar en el grid
CREATE PROCEDURE UDP_MostrarCiudades
AS
BEGIN
		SELECT [Ciudad_Id], [Ciudad_Descripcion] FROM [dbo].[tbl_Ciudades]
END

EXEC UDP_MostrarCiudades


-- udp para insertar ciudades
CREATE PROCEDURE UDP_InsertarCiudades
		@Descripción		NVARCHAR (255),
		@DepartamentoID		INT,
		@UsuarioCreacion	INT
AS
BEGIN
		INSERT INTO [dbo].[tbl_Ciudades](
							Ciudad_Descripcion, 
							Ciudad_DepartamentoId, 
							Ciudad_UsuarioCreacionId, 
							Ciudad_FechaCreacion, 
							Ciudad_UsuarioModificacionId, 
							Ciudad_FechaModificacion)
		VALUES(
							@Descripción,
							@DepartamentoID,
							@UsuarioCreacion,
							GETDATE(),
							NULL,
							NULL)
END

EXEC UDP_InsertarCiudades 'La Lima', 5, 1

-- udp para buscar ciudades
CREATE PROCEDURE UDP_BuscarCiudades
		@TextoBuscar	NVARCHAR(MAX)
AS
BEGIN
	SELECT [Ciudad_Id], [Ciudad_Descripcion] FROM [dbo].[tbl_Ciudades]
	WHERE  [Ciudad_Descripcion] LIKE @TextoBuscar + '%'
END

EXEC UDP_BuscarCiudades 'P'


-- udp para Obtener los datos de una Ciudad especifica
CREATE PROCEDURE UDP_ObtenerDatos_Ciudad
		@Id  INT
AS
BEGIN
		SELECT [Ciudad_Id], [Ciudad_Descripcion] FROM [dbo].[tbl_Ciudades]
		WHERE	[Ciudad_Id] = @Id
END

EXEC UDP_ObtenerDatos_Ciudad 8


--udp para editar los datos de una ciudad especifica
CREATE PROCEDURE UDP_EditarDatos_Ciudad
			@ID						INT,
			@Ciudad_Descripcion		NVARCHAR(255),
			@DepartamentoID			INT,
			@UsuarioMod				INT
AS
BEGIN
	UPDATE	[dbo].[tbl_Ciudades]
	SET		[Ciudad_Descripcion] = @Ciudad_Descripcion, [Ciudad_DepartamentoId] = @DepartamentoID,
			[Ciudad_UsuarioModificacionId] = @UsuarioMod, [Ciudad_FechaModificacion] = GETDATE()
	WHERE	[Ciudad_Id] = @ID
END

EXEC UDP_EditarDatos_Ciudad 10, 'Trujillo', 9,1


------------------------------------------------------------ DEPTOS ---------------------------------------------------
--udp para Mostar deptos
CREATE PROCEDURE UDP_MostarDeptos
AS
BEGIN
 SELECT [Departamento_ID], [Departamento_Descripcion] FROM [dbo].[tbl_Departamentos]
END

EXEC UDP_MostarDeptos


-- udp para Buscar Deptos por texto
CREATE OR ALTER PROCEDURE UDP_BuscarDeptos
		@Texto		NVARCHAR(MAX)
AS
BEGIN
	SELECT	[Departamento_ID], [Departamento_Descripcion] FROM [dbo].[tbl_Departamentos]
	WHERE	[Departamento_Descripcion] LIKE @Texto + '%'
END

EXEC UDP_BuscarDeptos 'C'


-- udp para Insertar Deptos
CREATE OR ALTER PROCEDURE UDP_InsertarDeptos
		@Departamento_Descripcion	NVARCHAR(150),
		@UsuarioCreacion				INT
AS
BEGIN
		INSERT INTO tbl_Departamentos (
					Departamento_Descripcion, 
					UsuarioCreacionID, 
					Depto_FechaCreacion, 
					Depto_UsuarioModificacionId, 
					Depto_FechaModificacion	)
		VALUES		(
					@Departamento_Descripcion,
					@UsuarioCreacion,
					GETDATE(),
					NULL,
					NULL)
END

EXEC UDP_InsertarDeptos 'Valle', 1

-- Obtener Datos especificos de un registro deptos
CREATE OR ALTER PROCEDURE UDP_ObtenerDatos_Deptos
		@ID			INT
AS
BEGIN
		SELECT [Departamento_ID], [Departamento_Descripcion] FROM [dbo].[tbl_Departamentos]
		WHERE	[Departamento_ID] = @ID
END

EXEC UDP_ObtenerDatos_Deptos 2


----- Editar datos especificos
CREATE OR ALTER PROCEDURE UDP_EditarDatos_Deptos
		@ID			INT,
		@Descrip	NVARCHAR(150),
		@UsuarioMod	INT
AS
BEGIN
		UPDATE	[dbo].[tbl_Departamentos]
		SET		[Departamento_Descripcion] = @Descrip , [Depto_UsuarioModificacionId] = @UsuarioMod,
				[Depto_FechaModificacion] = GETDATE()
		WHERE	[Departamento_ID] = @ID
END

EXEC UDP_EditarDatos_Deptos 2 , 'Cortés', 1



------------------------------------------------------------ ESTADO CIVIL ---------------------------------------------------
--- udp para mostrar los estados civiles
CREATE OR ALTER PROCEDURE UDP_MostrarEstadoCivil
AS
BEGIN
		SELECT [EstadoCivil_ID], [EstadoCivil_Descripcion] FROM [dbo].[tbl_EstadoCivil]
		WHERE	[Estado] = 1
END

EXEC UDP_MostrarEstadoCivil


-- udp para buscar estados civiles por texto
CREATE OR ALTER PROCEDURE UDP_BuscarEstadoCivil
		@Texto		NVARCHAR(MAX)
AS
BEGIN
		SELECT	[EstadoCivil_ID], [EstadoCivil_Descripcion] FROM [dbo].[tbl_EstadoCivil]
		WHERE	[EstadoCivil_Descripcion] LIKE @Texto + '%' AND [Estado] = 1
END

EXEC UDP_BuscarEstadoCivil 'C'

--- udp para Obtener Estados Civiles
CREATE OR ALTER PROCEDURE UDP_ObtenerEstadoCivil
			@ID	CHAR(1)
AS
BEGIN
		SELECT	[EstadoCivil_ID], [EstadoCivil_Descripcion] FROM [dbo].[tbl_EstadoCivil]
		WHERE	[EstadoCivil_ID] = @ID
END

EXEC UDP_ObtenerEstadoCivil 's'


-- udp para Editar Estados Civiles
CREATE OR ALTER PROCEDURE UDP_EditarEstadosCiviles
		@ID				CHAR,
		@Descr			NVARCHAR(150),
		@UsuarioMod		INT
AS
BEGIN
		UPDATE	[dbo].[tbl_EstadoCivil]
		SET		[EstadoCivil_Descripcion] = @Descr, [EstadoCivil_UsuarioModificacionId] = @UsuarioMod,
				[EstadoCivil_FechaModificacion] = GETDATE() , [Accion] = 'M'
		WHERE	[EstadoCivil_ID] = @ID
END

EXEC UDP_EditarEstadosCiviles 'v', 'Viudo(a)', 1


--- UDP PARA INSERTAR ESTADOS CIVILES
CREATE OR ALTER PROCEDURE UDP_Insertar_EstadosCiviles
			@ID					CHAR(1),
			@Descripcion		NVARCHAR(150),
			@UsuarioCreacion	INT
AS
BEGIN
			INSERT INTO tbl_EstadoCivil(
								EstadoCivil_ID, 
								EstadoCivil_Descripcion, 
								EstadoCivil_UsuarioCreacionID, 
								EstadoCivil_FechaCreacion,
								EstadoCivil_UsuarioModificacionId, 
								EstadoCivil_FechaModificacion, 
								Estado, 
								Accion)
			VALUES  (			@ID,
								@Descripcion,
								@UsuarioCreacion,
								GETDATE(),
								NULL,
								NULL,
								1,
								'C')
END

EXEC UDP_Insertar_EstadosCiviles 'a', 'Amantes', 2



-- udp para borrar estados civiles
CREATE OR ALTER PROCEDURE UDP_BorrarEstadoCivil
		@ID CHAR(1),
		@UsuarioMod INT
AS
BEGIN
		UPDATE	[dbo].[tbl_EstadoCivil]
		SET		[Estado] = 0, [EstadoCivil_UsuarioModificacionId] = @UsuarioMod, [EstadoCivil_FechaModificacion] = GETDATE(),
				[Accion] = 'E'
		WHERE	[EstadoCivil_ID] = @ID
END

EXEC UDP_BorrarEstadoCivil 'a', 1

------------------------------------------------------------ REPARACIÓN ---------------------------------------------------
CREATE OR ALTER PROCEDURE UDP_MostarReparación
AS
BEGIN
		SELECT	rep_ID, 
				T2.tipo_Descripcion AS 'Tipo de Trabajo', 
				T3.pro_Descripción	AS	'Producto', 
				T4.Cliente_Nombre + ' ' + Cliente_Apellido  AS	'Cliente',
				T5.Empleado_Nombre + ' ' + T5. Empleado_Apellido AS 'Técnico Encargado',
				rep_EstadoReparacion
		FROM	[dbo].[tbl_Reparación] T1			INNER JOIN [dbo].[tbl_TipoDeTrabajo]	T2
		ON		T1.rep_TipodeTrabajo = T2.tipo_ID	INNER JOIN [dbo].[tbl_Producto]			T3
		ON		T1.rep_Producto = T3.pro_ID			INNER JOIN [dbo].[tbl_Cliente]			T4
		ON		T1.rep_Cliente = T4.Cliente_Id		INNER JOIN [dbo].[tbl_Empleados]		T5
		ON		T1.rep_Empleado = T5.Empleado_ID
		WHERE	T1.Estado = 1
END

EXEC UDP_MostarReparación


---- udp buscar por texto
CREATE OR ALTER PROCEDURE UDP_BuscarReparación
		@Texto	NVARCHAR(MAX)
AS
BEGIN
		SELECT	rep_ID, 
				T2.tipo_Descripcion AS 'Tipo de Trabajo', 
				T3.pro_Descripción	AS	'Producto', 
				T4.Cliente_Nombre + ' ' + Cliente_Apellido  AS	'Cliente',
				T5.Empleado_Nombre + ' ' + T5. Empleado_Apellido AS 'Técnico Encargado',
				rep_EstadoReparacion
		FROM	[dbo].[tbl_Reparación] T1			INNER JOIN [dbo].[tbl_TipoDeTrabajo]	T2
		ON		T1.rep_TipodeTrabajo = T2.tipo_ID	INNER JOIN [dbo].[tbl_Producto]			T3
		ON		T1.rep_Producto = T3.pro_ID			INNER JOIN [dbo].[tbl_Cliente]			T4
		ON		T1.rep_Cliente = T4.Cliente_Id		INNER JOIN [dbo].[tbl_Empleados]		T5
		ON		T1.rep_Empleado = T5.Empleado_ID
		WHERE	T1.Estado = 1 
		AND  T4.Cliente_Nombre LIKE		@Texto + '%' OR T4.Cliente_Apellido LIKE @Texto + '%'
		OR	 T2.tipo_Descripcion LIKE	@Texto + '%'
		OR	 T3.pro_Descripción LIKE	@Texto + '%'
		OR	 rep_EstadoReparacion LIKE  @Texto + '%'
		OR	 T5.Empleado_Nombre LIKE    @Texto + '%'
		OR   T5.Empleado_Apellido LIKE  @Texto + '%'
END

EXEC UDP_BuscarReparación 'Angel'


-- udp para  insertar reparaciones 

CREATE OR ALTER PROCEDURE UDP_InsertarReparaciones
		@TipodeTrabajo		INT,
		@Producto			INT,
		@Cliente			INT,
		@Empleado			INT,
		@EstadoRep			NVARCHAR(MAX),
		@UsuarioCreacion	INT
AS
BEGIN
	INSERT INTO tbl_Reparación (
				rep_TipodeTrabajo, 
				rep_Producto, 
				rep_Cliente, 
				rep_Empleado, 
				rep_EstadoReparacion, 
				UsuarioCreacion, 
				UsuarioModificacion, 
				FechaCreacion, 
				FechaModificacion, 
				Estado, 
				Accion)
	VALUES (
			@TipodeTrabajo,
			@Producto,
			@Cliente,
			@Empleado,
			@EstadoRep,
			@UsuarioCreacion,
			NULL,
			GETDATE(),
			NULL,
			1,
			'C')
END

EXEC UDP_InsertarReparaciones 1,2,3,1,'Ingresado',1

-- udp para obtener datos de reparacion

CREATE OR ALTER PROCEDURE UDP_ObtenerDatos_Reparacion
		@ID  INT
AS
BEGIN
	SELECT	rep_ID, 
				T2.tipo_Descripcion AS 'Tipo de Trabajo', 
				T3.pro_Descripción	AS	'Producto', 
				T4.Cliente_Nombre + ' ' + Cliente_Apellido  AS	'Cliente',
				T5.Empleado_Nombre + ' ' + T5. Empleado_Apellido AS 'Técnico Encargado',
				rep_EstadoReparacion
		FROM	[dbo].[tbl_Reparación] T1			INNER JOIN [dbo].[tbl_TipoDeTrabajo]	T2
		ON		T1.rep_TipodeTrabajo = T2.tipo_ID	INNER JOIN [dbo].[tbl_Producto]			T3
		ON		T1.rep_Producto = T3.pro_ID			INNER JOIN [dbo].[tbl_Cliente]			T4
		ON		T1.rep_Cliente = T4.Cliente_Id		INNER JOIN [dbo].[tbl_Empleados]		T5
		ON		T1.rep_Empleado = T5.Empleado_ID
		WHERE	T1.Estado = 1 AND [rep_ID] = @ID
END

EXEC UDP_ObtenerDatos_Reparacion 11


-- udp para editar datos de la tabla reparacion

CREATE OR ALTER PROCEDURE UDP_EditarReparacion
		@rep_ID  INT, 
		@rep_TipodeTrabajo INT, 
		@rep_Producto INT, 
		@rep_Cliente  INT, 
		@rep_Empleado   INT, 
		@rep_EstadoReparacion NVARCHAR(MAX), 
		@UsuarioModificacion  INT
AS
BEGIN
	UPDATE tbl_Reparación
	SET [rep_TipodeTrabajo] = @rep_TipodeTrabajo, [rep_Producto] = @rep_Producto, [rep_Cliente] = @rep_Cliente,
		[rep_Empleado] = @rep_Empleado, [rep_EstadoReparacion] = @rep_EstadoReparacion, [UsuarioModificacion] = @UsuarioModificacion,
		[FechaModificacion] = GETDATE() , [Accion] = 'M'
	WHERE [rep_ID] = @rep_ID
END

EXEC UDP_EditarReparacion 2,2,2,2,2,'Ingresado', 2

--- udp para elimimar registro de reparacion

CREATE OR ALTER PROCEDURE UDP_EliminarReparacion
			@ID INT,
			@UsuModi INT
AS
BEGIN
		UPDATE tbl_Reparación
		SET		[Estado] = 0, [Accion] = 'E', [UsuarioModificacion] = @UsuModi, [FechaModificacion]=GETDATE()
		WHERE	[rep_ID] = @ID
END

EXEC UDP_EliminarReparacion 5,2

------------------------------------------------------------ USUARIOS ---------------------------------------------------
SELECT * FROM tbl_Usuarios

-- udp para mostrar los usuarios
CREATE OR ALTER PROCEDURE UDP_MostrarUsuarios
AS
BEGIN
 SELECT		[Usuario_UsuarioId],[Usuario_Usuario], T2.Empleado_Nombre +' '+T2.Empleado_Apellido AS 'Empleado'  FROM tbl_Usuarios T1 INNER JOIN [dbo].[tbl_Empleados] T2
 ON			T1.Usuario_Empleado = T2.Empleado_Id
 WHERE		[Usuario_Estado] = 1
END

EXEC UDP_MostrarUsuarios

---- udp para buscar usuarios por texto
CREATE OR ALTER PROCEDURE UDP_BuscarUsuarios
		@Texto nvarchar(max)
AS
BEGIN
		 SELECT		[Usuario_UsuarioId],[Usuario_Usuario], T2.Empleado_Nombre +' '+T2.Empleado_Apellido AS 'Empleado'  FROM tbl_Usuarios T1 INNER JOIN [dbo].[tbl_Empleados] T2
 ON			T1.Usuario_Empleado = T2.Empleado_Id
 WHERE		[Usuario_Estado] = 1 AND [Usuario_Usuario] LIKE @Texto + '%' OR T2.Empleado_Nombre LIKE @Texto + '%' OR
			T2.Empleado_Apellido LIKE @Texto + '%'
END

EXEC UDP_BuscarUsuarios 'E'

--- udp para insertar usuarios
--CREATE OR ALTER PROCEDURE UDP_InsertarUsuarios
		DECLARE @Usuario_Usuario			NVARCHAR(255) = 'Angie'
		--@Usuario_Empleado			INT, 
		DECLARE @Usuario_Password			NVARCHAR(255) = 'angie'
--		@Usuario_UsuarioCreacionId	INT
--AS
--BEGIN
	DECLARE @PasswordEncrip VARBINARY(255)
	SET		@PasswordEncrip = ENCRYPTBYPASSPHRASE(@Usuario_Usuario, @Usuario_Password)
	PRINT	@PasswordEncrip
--END