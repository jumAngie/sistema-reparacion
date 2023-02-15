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





