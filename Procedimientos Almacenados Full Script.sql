----------------------------------------------------------- *** UDPS *** ----------------------------------------------------

------------------------------------------------------------ CIUDADES ---------------------------------------------------

-- udp para mostrar en el grid
CREATE OR ALTER  PROCEDURE UDP_MostrarCiudades
AS
BEGIN
		SELECT [Ciudad_Id], T2.Departamento_Descripcion, [Ciudad_Descripcion] 
		FROM [dbo].[tbl_Ciudades] T1 INNER JOIN [dbo].[tbl_Departamentos] T2
		ON	T1.Ciudad_DepartamentoId = T2.Departamento_ID
END

go

-- udp para insertar ciudades --
CREATE OR ALTER PROCEDURE UDP_InsertarCiudades
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
go
-- udp para buscar ciudades
CREATE OR ALTER PROCEDURE UDP_BuscarCiudades
		@TextoBuscar	NVARCHAR(MAX)
AS
BEGIN
	SELECT [Ciudad_Id], [Ciudad_Descripcion] FROM [dbo].[tbl_Ciudades]
	WHERE  [Ciudad_Descripcion] LIKE @TextoBuscar + '%'
END


go
-- udp para Obtener los datos de una Ciudad especifica
CREATE OR ALTER PROCEDURE UDP_ObtenerDatos_Ciudad
		@Id  INT
AS
BEGIN
		SELECT [Ciudad_Id], [Ciudad_Descripcion], [Ciudad_DepartamentoId] FROM [dbo].[tbl_Ciudades]
		WHERE	[Ciudad_Id] = @Id
END



go
--udp para editar los datos de una ciudad especifica
CREATE OR ALTER PROCEDURE UDP_EditarDatos_Ciudad
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
CREATE OR ALTER PROCEDURE UDP_MostarDeptos
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
------------------------------------------------------------

Create or Alter Procedure UDP_Mostrarrepa
as
begin 
select [rep_ID],
       [tipo_Descripción],
       [pro_Descripción],
	   Cliente_Nombre,
       Empleado_Nombre,
	   rep_EstadoReparacion
	   from [dbo].[tbl_Reparación] t1 inner join [dbo].[tbl_TipoDeTrabajo] t2
on t1.rep_TipodeTrabajo = t2.tipo_ID inner join [dbo].[tbl_Producto] t3 on t1.rep_Producto = t3.pro_ID inner join tbl_Cliente t4
on t1.rep_Empleado = t4.Cliente_Id inner join [dbo].[tbl_Empleados] t5 on t5.Empleado_Id = t1.rep_Empleado 
end 
-----------------------------------------------------------------

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
------------------------------------------------------------
Create or alter procedure UDP_BuscarReparacio
    @buscador      nvarchar(250)
as
begin 
     select [rep_ID],
       [tipo_Descripción],
       [pro_Descripción],
	   Cliente_Nombre,
       Empleado_Nombre,
	   rep_EstadoReparacion
	   from [dbo].[tbl_Reparación] t1 inner join [dbo].[tbl_TipoDeTrabajo] t2
on t1.rep_TipodeTrabajo = t2.tipo_ID inner join [dbo].[tbl_Producto] t3 on t1.rep_Producto = t3.pro_ID inner join tbl_Cliente t4
on t1.rep_Empleado = t4.Cliente_Id inner join [dbo].[tbl_Empleados] t5 on t5.Empleado_Id = t1.rep_Empleado 
Where tipo_Descripción  like '%'+ @buscador +'%' or pro_Descripción like '%'+ @buscador +'%' or rep_EstadoReparacion like '%'+ @buscador +'%'
or Empleado_Nombre like '%'+ @buscador +'%' or Empleado_Nombre like '%'+ @buscador +'%'

end
-----------------------------------------------------------------

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

select * from [dbo].[tbl_Reparación]

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

---------------------------------------------------------
   Create or alter Procedure UDP_Obtener_Reparacio
   @id   int 
as 

begin 
       SELECT	rep_ID, 
				T1.rep_TipodeTrabajo, 
				T1.rep_Producto, 
				T1.rep_Cliente ,
				T1.rep_Empleado,
				rep_EstadoReparacion
		FROM	[dbo].[tbl_Reparación] T1			INNER JOIN [dbo].[tbl_TipoDeTrabajo]	T2
		ON		T1.rep_TipodeTrabajo = T2.tipo_ID	INNER JOIN [dbo].[tbl_Producto]			T3
		ON		T1.rep_Producto = T3.pro_ID			INNER JOIN [dbo].[tbl_Cliente]			T4
		ON		T1.rep_Cliente = T4.Cliente_Id		INNER JOIN [dbo].[tbl_Empleados]		T5
		ON		T1.rep_Empleado = T5.Empleado_ID
		WHERE	T1.Estado = 1 AND [rep_ID] = @ID
end 



---------------------------------------------------------
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


-- udp para mostrar los usuarios
CREATE OR ALTER  PROCEDURE [dbo].[UDP_MostrarUsuarios]
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



---- udp para buscar usuarios por texto
CREATE OR ALTER PROCEDURE UDP_BuscarUsuarios
		@Texto nvarchar(max)
AS
BEGIN
		 SELECT		[Usuario_UsuarioId],[Usuario_Usuario], T2.Empleado_Nombre +' '+T2.Empleado_Apellido AS 'Empleado' , CASE [Usuario_UsuarioAdmin] 
			WHEN 1 THEN 'Sí'
			WHEN 0 THEN 'No'
			END AS 'Es Admin'  FROM tbl_Usuarios T1 INNER JOIN [dbo].[tbl_Empleados] T2
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
		DECLARE @PasswordEncryp NVARCHAR(255)
		SET @PasswordEncryp = CONVERT (NVARCHAR(255), HASHBYTES('SHA2_512', @Usuario_Password),2)
	
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
					@PasswordEncryp,
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

---- ud para obener los datos de un usuario
CREATE OR ALTER PROCEDURE UDP_ObtenerDatos_Usuarios
		@ID		INT
AS
BEGIN
	SELECT [Usuario_UsuarioId], [Usuario_Usuario], [Usuario_Empleado]
	FROM	[dbo].[tbl_Usuarios] WHERE [Usuario_UsuarioId] = @ID
END
---
--- udp para editar los datos de un usuario
CREATE OR ALTER   PROCEDURE [dbo].[UDP_EditarUsuarios]
			@ID INT,
			@Usuario NVARCHAR(255),
			@UsuModi INT
AS
BEGIN
   UPDATE tbl_Usuarios
   SET	   [Usuario_Usuario] = @Usuario, [Usuario_UsuarioModificacionId]=@UsuModi
   WHERE   [Usuario_UsuarioId] = @ID
END


------------------------------------------------------- CLIENTES -------------------------------------------

Create or Alter Procedure UDP_MostrarClientes
AS 
BEGIN
   SELECT Cliente_Id, 
          Cliente_Nombre, 
		  Cliente_Apellido, 
		  Cliente_Identidad, 
		  T2.EstadoCivil_Descripcion,
		  Cliente_Genero,
		  Cliente_Telefono, 
		  T3.Ciudad_Descripcion		
		  FROM [dbo].[tbl_Cliente] T1
		  INNER JOIN [dbo].[tbl_EstadoCivil] T2 ON T1.Cliente_EstadoCivilId = T2.EstadoCivil_ID
		  INNER JOIN [dbo].[tbl_Ciudades] T3 ON T1.Cliente_CiudadId = T3.Ciudad_Id 
		  where Cliente_Estado=1
END 

----------------------------------------------------

CREATE OR ALTER pROCEDURE UDP_BuscarClientes
   @buscador  nvarchar(max)
as 
begin 
    SELECT	Cliente_Id, 
			Cliente_Nombre, 
			Cliente_Apellido, 
			Cliente_Identidad, 
			T2.EstadoCivil_Descripcion,
			Cliente_Genero,
			Cliente_Telefono, 
			T3.Ciudad_Descripcion
		  FROM [dbo].[tbl_Cliente] T1
		  INNER JOIN [dbo].[tbl_EstadoCivil] T2 ON T1.Cliente_EstadoCivilId = T2.EstadoCivil_ID
		  INNER JOIN [dbo].[tbl_Ciudades] T3 ON T1.Cliente_CiudadId = T3.Ciudad_Id   
		  Where Cliente_Id like '%'+@buscador+'%' or Cliente_Nombre like '%'+@buscador+'%' or Cliente_Apellido like '%'+@buscador+'%' or 
		  Cliente_Identidad = '%'+@buscador+'%' or Cliente_Genero = '%'+@buscador+'%'  or Cliente_Telefono like 
		  '%'+@buscador+'%' or Cliente_EstadoCivilId = '%'+@buscador+'%' or T3.Ciudad_Descripcion = '%'+@buscador+'%' 
end 


-- udp para obtener datos
CREATE OR ALTER PROCEDURE UDP_ObtenerDatos_Cliente
		@ID  INT
AS
BEGIN
		SELECT	[Cliente_Id], [Cliente_Nombre] , [Cliente_Apellido], [Cliente_Identidad], [EstadoCivil_ID], Cliente_EstadoCivilId, t3.Ciudad_DepartamentoId, Cliente_CiudadId,
				T2.EstadoCivil_Descripcion, [Cliente_Genero],[Cliente_Telefono] ,T3.Ciudad_Descripcion
		FROM	[dbo].[tbl_Cliente] T1				INNER JOIN [dbo].[tbl_EstadoCivil] T2
		ON		T1.Cliente_EstadoCivilId = T2.EstadoCivil_ID	INNER JOIN [dbo].[tbl_Ciudades] T3
		ON		T1.Cliente_CiudadId = T3.Ciudad_Id
		WHERE	[Cliente_Id] = @ID
END

-- EDITAR
Create or Alter Procedure UDP_EditarClientes
   @id                          int ,
   @Nombre                      nvarchar(250),
   @Apellido                    nvarchar(250),
   @identidad                   nvarchar(250),
   @EstadoCivil                 char,
   @genero                      char,
   @telefono                    nvarchar(250),
   @ciudad                      int,
   @UsuarioModificacionId       int
  

as
begin 
     Update [dbo].[tbl_Cliente]
	 set [Cliente_Nombre] = @Nombre, [Cliente_Apellido] =@Apellido, Cliente_Identidad = @identidad,
     Cliente_EstadoCivilId = @EstadoCivil, [Cliente_Genero]=@genero,[Cliente_Telefono]=@telefono,[Cliente_CiudadId]=@ciudad,
	 [Cliente_UsuarioModificacionId]=@UsuarioModificacionId, [Cliente_FechaModificacion]=getdate()
	 where [Cliente_Id]=@id
end 
------------------------------------------------

Create or Alter Procedure UDP_InsertCliente
   @Nombre                      nvarchar(250),
   @Apellido                    nvarchar(250),
   @identidad                   nvarchar(250),
   @EstadoCivil                 char,
   @genero                      char,
   @telefono                    nvarchar(250),
   @ciudad                      int,
   @usuariocreacion             int
as 

begin 
   Insert into [dbo].[tbl_Cliente]
   values (@Nombre,@Apellido,@identidad,@EstadoCivil,@genero,@telefono,@ciudad, @usuariocreacion,GEtdate(),null,null,1)
end 
--------------------------------------------------------
Create or Alter Procedure UDP_EliminarCliente     
    @idAeliminar  int ,
	@UsuarioModi  int
as
begin 
   update	[dbo].[tbl_Cliente]
   set		[Cliente_Estado]=0, [Cliente_UsuarioModificacionId] = @UsuarioModi, [Cliente_FechaModificacion] = GETDATE()
   Where	[Cliente_Id]=@idAeliminar

end 

-------------------------------------------------------UDPS DE EMPLEADOS------------------------------------------------------------
cREATE OR ALTER procedure UDP_MostrarEmpleados        
as
begin 
SELECT       Empleado_Id, 
	         Empleado_Nombre, 
			 Empleado_Apellido, 
			 Empleado_Identidad, 
			 t2.EstadoCivil_Descripcion, 
			 Empleado_Genero, 
			 Empleado_Telefono, 
			 t3.Ciudad_Descripcion, 
			 Empleado_Puesto 			 
			 fROM [dbo].[tbl_Empleados] T1 INNER JOIN [dbo].[tbl_EstadoCivil] T2 
			 ON T1.Empleado_EstadoCivilId=T2.EstadoCivil_ID INNER JOIN [dbo].[tbl_Ciudades] T3
   			 ON T1.Empleado_CiudadId= T3.Ciudad_Id
			 Where [Empleado_Estado]=1
end 

CREATE OR ALTER PROCEDURE UDP_InsertarEmpleados
		@Empleado_Nombre   NVARCHAR(255), 
		@Empleado_Apellido NVARCHAR(255), 
		@Empleado_Identidad NVARCHAR(30), 
		@Empleado_EstadoCivilId CHAR(1), 
		@Empleado_Genero CHAR(1), 
		@Empleado_Telefono NVARCHAR(15), 
		@Empleado_CiudadId INT, 
		@Empleado_Puesto NVARCHAR(250), 
		@Empleado_UsuarioCreacionId INT
AS
BEGIN
	INSERT INTO tbl_Empleados ( 
	Empleado_Nombre, 
	Empleado_Apellido, 
	Empleado_Identidad, 
	Empleado_EstadoCivilId, 
	Empleado_Genero, 
	Empleado_Telefono, 
	Empleado_CiudadId, 
	Empleado_Puesto, 
	Empleado_UsuarioCreacionId, 
	Empleado_FechaCreacion, 
	Empleado_UsuarioModificacionId, 
	Empleado_FechaModificacion, 
	Empleado_Estado)
VALUES  (@Empleado_Nombre,
		@Empleado_Apellido,
		@Empleado_Identidad,
		@Empleado_EstadoCivilId,
		@Empleado_Genero,
		@Empleado_Telefono,
		@Empleado_CiudadId,
		@Empleado_Puesto,
		@Empleado_UsuarioCreacionId,
		GETDATE(),
		NULL,
		NULL,
		1)
END
----------------------------------------------
cREATE OR aLTER pROCEDURE UDP_BuscarEmpleados
      @buscador    nvarchar(max)
as 
begin 
    select   Empleado_Id, 
	         Empleado_Nombre, 
			 Empleado_Apellido, 
			 Empleado_Identidad, 
			 t2.EstadoCivil_Descripcion, 
			 Empleado_Genero, 
			 Empleado_Telefono, 
			 t3.Ciudad_Descripcion, 
			 Empleado_Puesto 			 
			 fROM [dbo].[tbl_Empleados] T1 INNER JOIN [dbo].[tbl_EstadoCivil] T2 
			 ON T1.Empleado_EstadoCivilId=T2.EstadoCivil_ID INNER JOIN [dbo].[tbl_Ciudades] T3
  			 ON T1.Empleado_CiudadId= T3.Ciudad_Id
             WHERE  Empleado_Id LIKE '%'+@buscador+'%' OR Empleado_Nombre like '%'+@buscador+'%'
			 or Empleado_Apellido like '%'+@buscador+'%' or Empleado_Identidad like '%'+@buscador+'%'
			 or Empleado_Genero like '%'+@buscador+'%' or Empleado_Telefono like '%'+@buscador+'%'
			 or Empleado_Puesto like '%'+@buscador+'%' or T2.EstadoCivil_Descripcion = '%'+@buscador+'%'
			 or T3.Ciudad_Descripcion like '%'+@buscador+'%'
end

----------------

CREATE OR ALTER PROCEDURE UDP_ObtenerDatos_Empleado
		@ID INT
AS
BEGIN
		SELECT Empleado_Id, Empleado_Nombre, Empleado_Apellido, Empleado_Identidad, Empleado_Genero, [Empleado_EstadoCivilId],[Ciudad_DepartamentoId]
				, Empleado_Telefono, Empleado_CiudadId, Empleado_Puesto FROM tbl_Empleados t1 inner join tbl_Ciudades t2
				on t1.Empleado_CiudadId = t2.Ciudad_Id 
		WHERE Empleado_ID = @ID
END




Create or alter Procedure UDP_EditarEmpleados
      @id           int, 
	  @Nombre       nvarchar(250),
	  @Apellido     nvarchar(250),
	  @Identidad    nvarchar(250),
	  @EstadoCivil  char,
	  @genero       Nvarchar(250),
	  @telefono     nvarchar(250),
	  @ciudad       int, 
	  @puesto       nvarchar(250),
	  @usuariomodifica  int 	  
as  
begin 
      Update [dbo].[tbl_Empleados]
	  set [Empleado_Nombre]= @Nombre,[Empleado_Apellido] =@Apellido, 
      [Empleado_Identidad]=@Identidad,[Empleado_EstadoCivilId] = @EstadoCivil,
	  [Empleado_Genero]=@genero, [Empleado_Telefono]=@telefono,[Empleado_CiudadId]=@ciudad,
      [Empleado_Puesto]=@puesto,[Empleado_UsuarioModificacionId]=@usuariomodifica,[Empleado_FechaModificacion]=GETDATE()
      WHERE [Empleado_Id]=@id 
end 

Create or Alter Procedure UDP_EliminarEmpleado

      @idaEliminar   int ,
	  @UsuarioModi  int
as
begin 
     UPDATE [dbo].[tbl_Empleados]
	 SET	[Empleado_Estado]= 0 , [Empleado_UsuarioModificacionId] = @UsuarioModi, [Empleado_FechaModificacion]= GETDATE()
	 where	[Empleado_Id] = @idaEliminar 
end



--------------------------------------------------------UDP'S  Producto--------------- ------------------------------------
Create or alter procedure UDP_MostrarProducto
as
begin 
   Select  pro_ID, 
           pro_Descripción, 
		   pro_FechaIngreso 		  
   from		[dbo].[tbl_Producto]
   WHERE	[Estado] = 1
end 
------------------------------------------

Create or Alter procedure UDP_BuscarProducto
    @buscador     nvarchar(250)
as 
begin 
    Select  pro_ID, 
           pro_Descripción, 
		   pro_FechaIngreso
		   
   from  [dbo].[tbl_Producto]
   Where pro_ID like '%'+@buscador+'%' or pro_Descripción like'%'+@buscador+'%' or pro_FechaIngreso like '%'+@buscador+'%' 
end 


CREATE or alter PROCEDURE UDP_ObtenerDatosProductos
		@ID INT
AS
BEGIN
		SELECT [pro_Descripción], [pro_FechaIngreso] FROM [dbo].[tbl_Producto]
		WHERE  [pro_ID] = @ID
END

Create Or Alter Procedure UDP_EditarProducto
       @id                int, 
	   @descripcion       nvarchar(250),
       @Usumodificacion   int 
as

select * from [dbo].[tbl_Producto]


begin 
     Update [dbo].[tbl_Producto]
	 Set pro_Descripción = @descripcion, pro_FechaIngreso=getdate(),UsuarioModificacion=@Usumodificacion, 
	     [FechaModificacion] = GETDATE() , [Accion] = 'M'
	WHERE [pro_ID] = @id
end 

Create or ALTER   Procedure [dbo].[UDP_InsertarProducto]
       @descripcion     nvarchar(250), 
       @usuariocreacion int 

as
begin 
     insert into [dbo].[tbl_Producto]
	 values(@descripcion,GETDATE(),@usuariocreacion,null,GETDATE(),null,1,'C')
end 
-----------------------------------------------------------
create or ALTER   Procedure [dbo].[UDP_InsertarProducto]
       @descripcion     nvarchar(250), 
       @usuariocreacion int 

as
begin 
     insert into [dbo].[tbl_Producto]
	 values(@descripcion,GETDATE(),@usuariocreacion,null,GETDATE(),null,1,'C')
end 
-----------------------------------------------------------

CREATE OR ALTER Procedure  UDP_EliminarProducto 
      @idAusar   int,
	  @UsuModi   int
as 
Begin 
      Update [dbo].[tbl_Producto]
	  SET	 [Estado]=0, [UsuarioModificacion] = @UsuModi, [Accion] = 'E' , [FechaModificacion] = GETDATE()
	  WHERE  [pro_ID]=@idAusar
end 


----------------------------------------------------UDP's TipoDeTrabjo ---------------------------------------------------

Create or alter procedure  UDP_MostrarTipoDeTrabajo
as 
begin 
    SELECT	tipo_ID, 
			tipo_Descripción
    FROM	[dbo].[tbl_TipoDeTrabajo]
	WHERE	[Estado] = 1
end
-----------------------------------

Create or Alter Procedure UDP_BuscarTipoDeTrabajo
    @buscador    nvarchar(250)
as
begin
      SELECT tipo_ID, 
			tipo_Descripción
      fROM  [dbo].[tbl_TipoDeTrabajo]
	  Where tipo_Descripción like '%'+@buscador+'%' and   [Estado]  = 1
end 
------------------------------------------------------------
CREATE OR ALTER PROCEDURE UDP_ObtenerDatos_TipoDeTrabajo
		@ID INT
AS
BEGIN
			SELECT tipo_ID, tipo_Descripción FROM tbl_TipoDeTrabajo WHERE [tipo_ID] = @ID
END
----------------------------------------------------------------------
Create or Alter Procedure UDP_EditarTipoDeTrabajo
     @id              int, 
	 @descripcion     nvarchar(250),
	 @usuario         int 
as
begin 
     Update [dbo].[tbl_TipoDeTrabajo]
	 set	[tipo_Descripción] = @descripcion, [UsuarioModificacion] = @usuario, [FechaModificacion] = GETDATE(),
			[Accion] = 'M'
	 from	[dbo].[tbl_TipoDeTrabajo]
	 Where	[tipo_ID]=@id
end 
--------------------------------------------------------------------
Create or Alter Procedure UDP_insertTipoDeTrabajo
       @descripcion       nvarchar(250),
       @usuariocreacion   int
as
begin 
     insert into tbl_TipoDeTrabajo
	 VALUES(@descripcion,@usuariocreacion,null,getdate(),null,1,'C')
end 
------------------------------------------------------------
Create or Alter Procedure UDP_EliminarTipoDeTrabajo
        @id int ,
		@UsuarioModi INT
as
begin 
     Update [dbo].[tbl_TipoDeTrabajo]
	 set	[Estado]=0 , [FechaModificacion] = GETDATE(), [UsuarioModificacion] = @UsuarioModi, [Accion] = 'E'
	 where	[tipo_ID]=@id 	 
end 

--------------------------------- UPDS  PARA LOS DDL ---------------------------------------------------------

---- empleados
CREATE OR ALTER PROCEDURE UDP_DDLEmpleados
AS
BEGIN
		SELECT Empleado_Id, Empleado_Nombre + ' ' + Empleado_Apellido AS 'Nombre Empleado' FROM tbl_Empleados
END

---- estados civiles
CREATE OR ALTER PROCEDURE UDP_DDLEstadosCiviles
AS
BEGIN
		SELECT EstadoCivil_ID, EstadoCivil_Descripcion FROM tbl_EstadoCivil
END

------ deptos

CREATE OR ALTER PROCEDURE UDP_DDLDepartamentos
AS
BEGIN
			SELECT Departamento_ID, Departamento_Descripcion FROM tbl_Departamentos
END

----- ciudades
CREATE OR ALTER PROCEDURE UDP_DDLCiudades
		@DeptoID INT
AS
BEGIN
			SELECT Ciudad_Id, Ciudad_Descripcion FROM tbl_Ciudades
			WHERE	Ciudad_DepartamentoId = @DeptoID
END

---- clientes
CREATE OR ALTER PROCEDURE UDP_DDLClientes
AS
BEGIN
		SELECT Cliente_Id, Cliente_Nombre +' '+ Cliente_Apellido AS 'Cliente' FROM tbl_Cliente
END

---- tipo de trabajo
CREATE OR ALTER PROCEDURE UDP_DDLTipoDeTrabajo
AS
BEGIN
		SELECT tipo_ID, tipo_Descripción FROM tbl_TipoDeTrabajo
END

------------------------------------------------ UDP PARA EL LOGIN ----------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE UDP_Login
		@Username NVARCHAR(255),
		@Password NVARCHAR(MAX)
AS
BEGIN
		DECLARE @PasswordEncryp NVARCHAR(255)
		SET @PasswordEncryp = CONVERT (NVARCHAR(255), HASHBYTES('SHA2_512', @Password), 2)

		SELECT [Usuario_UsuarioId], [Usuario_Usuario] , [Usuario_Password], [Usuario_UsuarioAdmin] FROM [dbo].[tbl_Usuarios]
		WHERE  Usuario_Usuario = @Username AND Usuario_Password = @PasswordEncryp
		
END

--- contraseñas = angie
EXEC UDP_InsertarUsuarios 'AngieCC',2,'angie',1,0

----------------------------------
CREATE OR ALTER PROCEDURE UDP_VerificarUsuario
		@Usuario		NVARCHAR(255)
AS
BEGIN
		SELECT [Usuario_Usuario] FROM tbl_Usuarios
		WHERE	[Usuario_Usuario] = @Usuario
END
------------------------------
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
----------------------------
CREATE OR ALTER PROCEDURE UDP_MostrarTickectCliente
		@ID NVARCHAR(100)
AS
BEGIN
	SELECT	rep_Cliente, T1.Cliente_Nombre + ' ' + t1.Cliente_Apellido AS 'Cliente', T2.Empleado_Nombre + ' ' + T2.Empleado_Apellido AS 'Empleado', T3.pro_Descripción, rep_EstadoReparacion 
	FROM	tbl_Reparación T0					INNER JOIN [dbo].[tbl_Cliente] T1
	ON		T0.rep_Cliente = t1.Cliente_Id		INNER JOIN [dbo].[tbl_Empleados] T2
	ON		T0.rep_Empleado = T2.Empleado_Id	INNER JOIN [dbo].[tbl_Producto]  T3
	ON		T0.rep_Producto = T3.pro_ID
	WHERE	rep_Cliente = @ID
END

-----------------------------
CREATE OR ALTER PROCEDURE UDP_MostrarTickecktEmpleado
		@ID NVARCHAR(100)
AS
BEGIN
		SELECT	rep_Empleado,  T2.Empleado_Nombre + ' ' + T2.Empleado_Apellido AS 'Empleado', T3.pro_Descripción, rep_EstadoReparacion
		FROM	tbl_Reparación T1				INNER JOIN [dbo].[tbl_Empleados] T2
		ON		T1.rep_Empleado = T2.Empleado_Id		INNER JOIN [dbo].[tbl_Producto] T3
		ON		T1.rep_Producto = T3.pro_ID
		WHERE	rep_Empleado = @ID
END
-----------------------------------------
CREATE OR ALTER  PROCEDURE UDP_MostrarTicketServicios
		@ID NVARCHAR(20)
AS
BEGIN
	SELECT T3.tipo_Descripción,T2.pro_Descripción, rep_EstadoReparacion FROM tbl_Reparación T1
	INNER JOIN	[dbo].[tbl_Producto] T2 
	ON	T1.rep_Producto = T2.pro_ID INNER JOIN [dbo].[tbl_TipoDeTrabajo] T3
	ON	T1.rep_TipodeTrabajo = t3.tipo_ID
	WHERE	T1.rep_TipodeTrabajo = @ID AND T1.Estado = 1
END