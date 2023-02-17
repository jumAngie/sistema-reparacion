
CREATE OR ALTER PROCEDURE UDP_VerificarUsuario
		@Usuario		NVARCHAR(255)
AS
BEGIN
		SELECT [Usuario_Usuario] FROM tbl_Usuarios
		WHERE	[Usuario_Usuario] = @Usuario
END

EXEC UDP_VerificarUsuario 'AngieCC'

go
CREATE OR ALTER PROCEDURE UDP_RestablecerContraseña
		@Usuario		NVARCHAR(255),
		@Contraseña		NVARCHAR(MAX)
AS
BEGIN
		DECLARE @PasswordEncryp NVARCHAR(MAX)
		SET @PasswordEncryp = CONVERT (NVARCHAR(MAX), HASHBYTES('SHA2_512', @Contraseña), 2)

		UPDATE	tbl_Usuarios
		SET		[Usuario_Password] = @PasswordEncryp
		WHERE	[Usuario_Usuario] = @Usuario
END

go
ALTER  PROCEDURE [dbo].[UDP_MostrarUsuarios]
AS
BEGIN
 SELECT		[Usuario_UsuarioId],[Usuario_Usuario], T2.Empleado_Nombre +' '+T2.Empleado_Apellido AS 'Empleado', 
			CASE [Usuario_UsuarioAdmin] 
			WHEN 1 THEN 'Sí'
			WHEN 0 THEN 'No'
			END AS 'Es Admin' 
			FROM tbl_Usuarios T1 INNER JOIN [dbo].[tbl_Empleados] T2
 ON			T1.Usuario_Empleado = T2.Empleado_Id
 WHERE		[Usuario_Estado] = 1
END

EXEC UDP_MostrarUsuarios