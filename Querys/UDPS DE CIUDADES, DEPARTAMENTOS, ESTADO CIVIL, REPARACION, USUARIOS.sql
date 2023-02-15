------------------------------------------------------------ CIUDADES ---------------------------------------------------

-- udp para mostrar en el grid
CREATE PROCEDURE UDP_MostrarCiudades
AS
BEGIN
		SELECT [Ciudad_Id], [Ciudad_Descripcion] FROM [dbo].[tbl_Ciudades]
END

EXEC UDP_MostrarCiudades
GO

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
GO
-- udp para buscar ciudades
CREATE PROCEDURE UDP_BuscarCiudades
		@TextoBuscar	NVARCHAR(MAX)
AS
BEGIN
	SELECT [Ciudad_Id], [Ciudad_Descripcion] FROM [dbo].[tbl_Ciudades]
	WHERE  [Ciudad_Descripcion] LIKE @TextoBuscar + '%'
END

EXEC UDP_BuscarCiudades 'P'
GO

-- udp para Obtener los datos de una Ciudad especifica
CREATE PROCEDURE UDP_ObtenerDatos_Ciudad
		@Id  INT
AS
BEGIN
		SELECT [Ciudad_Id], [Ciudad_Descripcion] FROM [dbo].[tbl_Ciudades]
		WHERE	[Ciudad_Id] = @Id
END

EXEC UDP_ObtenerDatos_Ciudad 8
GO

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
GO

------------------------------------------------------------ DEPTOS ---------------------------------------------------
--udp para Mostar deptos
CREATE PROCEDURE UDP_MostarDeptos
AS
BEGIN
 SELECT [Departamento_ID], [Departamento_Descripcion] FROM [dbo].[tbl_Departamentos]
END

EXEC UDP_MostarDeptos
GO

-- udp para Buscar Deptos por texto
CREATE OR ALTER PROCEDURE UDP_BuscarDeptos
		@Texto		NVARCHAR(MAX)
AS
BEGIN
	SELECT	[Departamento_ID], [Departamento_Descripcion] FROM [dbo].[tbl_Departamentos]
	WHERE	[Departamento_Descripcion] LIKE @Texto + '%'
END

EXEC UDP_BuscarDeptos 'C'
GO

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
GO
-- Obtener Datos especificos de un registro deptos
CREATE OR ALTER PROCEDURE UDP_ObtenerDatos_Deptos
		@ID			INT
AS
BEGIN
		SELECT [Departamento_ID], [Departamento_Descripcion] FROM [dbo].[tbl_Departamentos]
		WHERE	[Departamento_ID] = @ID
END

EXEC UDP_ObtenerDatos_Deptos 2
GO

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
GO


------------------------------------------------------------ ESTADO CIVIL ---------------------------------------------------
--- udp para mostrar los estados civiles
CREATE OR ALTER PROCEDURE UDP_MostrarEstadoCivil
AS
BEGIN
		SELECT [EstadoCivil_ID], [EstadoCivil_Descripcion] FROM [dbo].[tbl_EstadoCivil]
END

EXEC UDP_MostrarEstadoCivil
GO

-- udp para buscar estados civiles por texto
CREATE OR ALTER PROCEDURE UDP_BuscarEstadoCivil
		@Texto		NVARCHAR(MAX)
AS
BEGIN
		SELECT	[EstadoCivil_ID], [EstadoCivil_Descripcion] FROM [dbo].[tbl_EstadoCivil]
		WHERE	[EstadoCivil_Descripcion] LIKE @Texto + '%'
END

EXEC UDP_BuscarEstadoCivil 'C'
go
--- udp para Obtener Estados Civiles
CREATE OR ALTER PROCEDURE UDP_ObtenerEstadoCivil
			@ID	CHAR(1)
AS
BEGIN
		SELECT	[EstadoCivil_ID], [EstadoCivil_Descripcion] FROM [dbo].[tbl_EstadoCivil]
		WHERE	[EstadoCivil_ID] = @ID
END

EXEC UDP_ObtenerEstadoCivil 's'
GO

-- udp para Editar Estados Civiles
CREATE OR ALTER PROCEDURE UDP_EditarEstadosCiviles
		@ID				CHAR,
		@Descr			NVARCHAR(150),
		@UsuarioMod		INT
AS
BEGIN
		UPDATE	[dbo].[tbl_EstadoCivil]
		SET		[EstadoCivil_Descripcion] = @Descr, [EstadoCivil_UsuarioModificacionId] = @UsuarioMod,
				[EstadoCivil_FechaModificacion] = GETDATE()
		WHERE	[EstadoCivil_ID] = @ID
END

EXEC UDP_EditarEstadosCiviles 'v', 'Viudo(a)', 1
GO
------------------------------------------------------------ REPARACIÓN ---------------------------------------------------
CREATE OR ALTER PROCEDURE UDP_MostarReparación
AS
BEGIN
		SELECT	rep_ID, 
				T2.tipo_Descripcion AS 'Tipo de Trabajo', 
				T3.pro_Descripcion	AS	'Producto', 
				T4.Cliente_Nombre + ' ' + Cliente_Apellido  AS	'Cliente',
				T5.Empleado_Nombre + ' ' + T5. Empleado_Apellido AS 'Técnico Encargado',
				rep_EstadoReparacion
		FROM	[dbo].[tbl_Reparacion] T1			INNER JOIN [dbo].[tbl_TipoDeTrabajo]	T2
		ON		T1.rep_TipodeTrabajo = T2.tipo_ID	INNER JOIN [dbo].[tbl_Producto]			T3
		ON		T1.rep_Producto = T3.pro_ID			INNER JOIN [dbo].[tbl_Cliente]			T4
		ON		T1.rep_Cliente = T4.Cliente_Id		INNER JOIN [dbo].[tbl_Empleados]		T5
		ON		T1.rep_Empleado = T5.Empleado_ID
		WHERE	T1.Estado = 1
END

EXEC UDP_MostarReparación
GO

---- udp buscar por texto
CREATE OR ALTER PROCEDURE UDP_BuscarReparación
		@Texto	NVARCHAR(MAX)
AS
BEGIN
		SELECT	rep_ID, 
				T2.tipo_Descripcion AS 'Tipo de Trabajo', 
				T3.pro_Descripcion	AS	'Producto', 
				T4.Cliente_Nombre + ' ' + Cliente_Apellido  AS	'Cliente',
				T5.Empleado_Nombre + ' ' + T5. Empleado_Apellido AS 'Técnico Encargado',
				rep_EstadoReparacion
		FROM	[dbo].[tbl_Reparacion] T1			INNER JOIN [dbo].[tbl_TipoDeTrabajo]	T2
		ON		T1.rep_TipodeTrabajo = T2.tipo_ID	INNER JOIN [dbo].[tbl_Producto]			T3
		ON		T1.rep_Producto = T3.pro_ID			INNER JOIN [dbo].[tbl_Cliente]			T4
		ON		T1.rep_Cliente = T4.Cliente_Id		INNER JOIN [dbo].[tbl_Empleados]		T5
		ON		T1.rep_Empleado = T5.Empleado_ID
		WHERE	T1.Estado = 1 
		AND  T4.Cliente_Nombre LIKE		@Texto + '%' OR T4.Cliente_Apellido LIKE @Texto + '%'
		OR	 T2.tipo_Descripcion LIKE	@Texto + '%'
		OR	 T3.pro_Descripcion LIKE	@Texto + '%'
		OR	 rep_EstadoReparacion LIKE  @Texto + '%'
		OR	 T5.Empleado_Nombre LIKE    @Texto + '%'
		OR   T5.Empleado_Apellido LIKE  @Texto + '%'
END

EXEC UDP_BuscarReparación 'Angel'
GO