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

EXECUTE UDP_MostrarClientes 

cREATE OR ALTER pROCEDURE UDP_BuscarClientes
   @buscador  nvarchar(max)
as 
begin 
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
		  Where Cliente_Id like '%'+@buscador+'%' or Cliente_Nombre like '%'+@buscador+'%' or Cliente_Apellido like '%'+@buscador+'%' or 
		  Cliente_Identidad = '%'+@buscador+'%' or Cliente_Genero = '%'+@buscador+'%'  or Cliente_Telefono like 
		  '%'+@buscador+'%' or Cliente_EstadoCivilId = '%'+@buscador+'%' or T3.Ciudad_Descripcion = '%'+@buscador+'%' 
end 


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


Create or Alter Procedure UDP_EliminarCliente     
    @idAeliminar  int 
as
begin 
   update [dbo].[tbl_Empleados]
   set [Empleado_Estado]=0
   Where [Empleado_Id]=@idAeliminar

end 




-----------UDPS DE EMPLEADOS
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

      @idaEliminar   int 
as
begin 
     UPDATE [dbo].[tbl_Empleados]
	 SET [Empleado_Estado]=0
	 where [Empleado_Estado] = @idaEliminar 

end 

----------------UDP'S  Producto--------------- 
Create or alter procedure UDP_MostrarProducto
as
begin 
   Select  pro_ID, 
           pro_Descripción, 
		   pro_FechaIngreso, 
		   UsuarioCreacion, 
		   UsuarioModificacion, 
		   FechaCreacion, 
		   FechaModificacion,
		   Estado,
		   Accion
   from  [dbo].[tbl_Producto]
end 

Create or Alter procedure UDP_BuscarProducto
    @buscador     nvarchar(250)
as 
begin 
    Select  pro_ID, 
           pro_Descripción, 
		   pro_FechaIngreso, 
		   UsuarioCreacion, 
		   UsuarioModificacion, 
		   FechaCreacion, 
		   FechaModificacion,
		   Estado,
		   Accion
   from  [dbo].[tbl_Producto]
   Where pro_ID like '%'+@buscador+'%' or pro_Descripción like'%'+@buscador+'%' or pro_FechaIngreso like '%'+@buscador+'%' 
end 


Create Or Alter Procedure UDP_EditarProducto
       @id                int, 
	   @descripcion       nvarchar(250),
       @Fecha             Date, 
       @Usumodificacion   int 
as

begin 
     Update [dbo].[tbl_Producto]
	 Set pro_Descripción = @descripcion, pro_FechaIngreso=@Fecha,UsuarioModificacion=@Usumodificacion
end 

Create or Alter Procedure UDP_InsertarProducto
       @descripcion     nvarchar(250),
	   @fecha           date, 
       @usuariocreacion int 

as
begin 
     insert into [dbo].[tbl_Producto]
	 values(@descripcion,@fecha,@usuariocreacion,null,GETDATE(),null,1,'u')
end 

CREATE OR ALTER Procedure  UDP_EliminarProducto 
      @idAusar   int 
as 
Begin 
      Update [dbo].[tbl_Producto]
	  set [Estado]=0
	  where [pro_ID]=@idAusar
end 









