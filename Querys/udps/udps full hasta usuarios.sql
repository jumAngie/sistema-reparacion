----------------------------------------------------------- *** UDPS *** ----------------------------------------------------

------------------------------------------------------------ CIUDADES ---------------------------------------------------

-- udp para mostrar en el grid
CREATE PROCEDURE UDP_MostrarCiudades
AS
BEGIN
		SELECT [Ciudad_Id], [Ciudad_Descripcion] FROM [dbo].[tbl_Ciudades]
END

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

-- udp para buscar ciudades
CREATE PROCEDURE UDP_BuscarCiudades
		@TextoBuscar	NVARCHAR(MAX)
AS
BEGIN
	SELECT [Ciudad_Id], [Ciudad_Descripcion] FROM [dbo].[tbl_Ciudades]
	WHERE  [Ciudad_Descripcion] LIKE @TextoBuscar + '%'
END



-- udp para Obtener los datos de una Ciudad especifica
CREATE PROCEDURE UDP_ObtenerDatos_Ciudad
		@Id  INT
AS
BEGIN
		SELECT [Ciudad_Id], [Ciudad_Descripcion] FROM [dbo].[tbl_Ciudades]
		WHERE	[Ciudad_Id] = @Id
END




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


------------------------------------------------------------ DEPTOS ---------------------------------------------------
--udp para Mostar deptos
CREATE PROCEDURE UDP_MostarDeptos
AS
BEGIN
 SELECT [Departamento_ID], [Departamento_Descripcion] FROM [dbo].[tbl_Departamentos]
END




-- udp para Buscar Deptos por texto
CREATE OR ALTER PROCEDURE UDP_BuscarDeptos
		@Texto		NVARCHAR(MAX)
AS
BEGIN
	SELECT	[Departamento_ID], [Departamento_Descripcion] FROM [dbo].[tbl_Departamentos]
	WHERE	[Departamento_Descripcion] LIKE @Texto + '%'
END




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



-- Obtener Datos especificos de un registro deptos
CREATE OR ALTER PROCEDURE UDP_ObtenerDatos_Deptos
		@ID			INT
AS
BEGIN
		SELECT [Departamento_ID], [Departamento_Descripcion] FROM [dbo].[tbl_Departamentos]
		WHERE	[Departamento_ID] = @ID
END




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





------------------------------------------------------------ ESTADO CIVIL ---------------------------------------------------
--- udp para mostrar los estados civiles
CREATE OR ALTER PROCEDURE UDP_MostrarEstadoCivil
AS
BEGIN
		SELECT [EstadoCivil_ID], [EstadoCivil_Descripcion] FROM [dbo].[tbl_EstadoCivil]
		WHERE	[Estado] = 1
END




-- udp para buscar estados civiles por texto
CREATE OR ALTER PROCEDURE UDP_BuscarEstadoCivil
		@Texto		NVARCHAR(MAX)
AS
BEGIN
		SELECT	[EstadoCivil_ID], [EstadoCivil_Descripcion] FROM [dbo].[tbl_EstadoCivil]
		WHERE	[EstadoCivil_Descripcion] LIKE @Texto + '%' AND [Estado] = 1
END



--- udp para Obtener Estados Civiles
CREATE OR ALTER PROCEDURE UDP_ObtenerEstadoCivil
			@ID	CHAR(1)
AS
BEGIN
		SELECT	[EstadoCivil_ID], [EstadoCivil_Descripcion] FROM [dbo].[tbl_EstadoCivil]
		WHERE	[EstadoCivil_ID] = @ID
END




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



------------------------------------------------------------ REPARACIÓN ---------------------------------------------------
CREATE OR ALTER PROCEDURE UDP_MostarReparación
AS
BEGIN
		SELECT	rep_ID, 
				T2.tipo_Descripción AS 'Tipo de Trabajo', 
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




---- udp buscar por texto
CREATE OR ALTER PROCEDURE UDP_BuscarReparación
		@Texto	NVARCHAR(MAX)
AS
BEGIN
		SELECT	rep_ID, 
				T2.tipo_Descripción AS 'Tipo de Trabajo', 
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
		OR	 T2.tipo_Descripción LIKE	@Texto + '%'
		OR	 T3.pro_Descripción LIKE	@Texto + '%'
		OR	 rep_EstadoReparacion LIKE  @Texto + '%'
		OR	 T5.Empleado_Nombre LIKE    @Texto + '%'
		OR   T5.Empleado_Apellido LIKE  @Texto + '%'
END




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



-- udp para obtener datos de reparacion

CREATE OR ALTER PROCEDURE UDP_ObtenerDatos_Reparacion
		@ID  INT
AS
BEGIN
	SELECT	rep_ID, 
				T2.tipo_Descripción AS 'Tipo de Trabajo', 
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

--- udp para insertar usuarios
CREATE OR ALTER PROCEDURE UDP_InsertarUsuarios
		@Usuario_Usuario			NVARCHAR(255),
		@Usuario_Empleado			INT, 
		@Usuario_Password			NVARCHAR(255),
		@Usuario_UsuarioCreacionId	INT,
		@Usuario_UsuarioAdmin		BIT
AS
BEGIN
	DECLARE @Password VARBINARY(255)
	SET @Password = ENCRYPTBYPASSPHRASE (@Usuario_Usuario, @Usuario_Password)
	SET @Usuario_Password = CONVERT (NVARCHAR(255), @Password, 1)
	
	INSERT INTO tbl_Usuarios(
					Usuario_Usuario, 
					Usuario_Empleado, 
					Usuario_Password, 
					Usuario_UsuarioCreacionId, 
					Usuario_FechaCreacion, 
					Usuario_UsuarioModificacionId, 
					Usuario_FechaModificacion, 
					Usuario_UsuarioAdmin, 
					Usuario_Estado)
	VALUES			(
	
					@Usuario_Usuario,
					@Usuario_Empleado,
					@Usuario_Password,
					@Usuario_UsuarioCreacionId,
					GETDATE(),
					NULL,
					NULL,
					@Usuario_UsuarioAdmin,
					1)
END

---- udp para eliminar campos de usuario
CREATE OR ALTER PROCEDURE UDP_EliminarUsuarios
		@ID			INT,
		@UsuModi	INT
AS
BEGIN
		UPDATE	tbl_Usuarios
		SET		[Usuario_Estado] = 0, [Usuario_UsuarioModificacionId] = @UsuModi, [Usuario_FechaModificacion] = GETDATE()
		WHERE	[Usuario_UsuarioId] = @ID
END



