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

EXEC UDP_InsertarDeptos ''