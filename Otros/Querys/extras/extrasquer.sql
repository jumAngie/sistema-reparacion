USE [BD_Reparaciones]
GO
/****** Object:  StoredProcedure [dbo].[UDP_InsertarProducto]    Script Date: 17/2/2023 09:02:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   Procedure [dbo].[UDP_InsertarProducto]
       @descripcion     nvarchar(250), 
       @usuariocreacion int 

as
begin 
     insert into [dbo].[tbl_Producto]
	 values(@descripcion,GETDATE(),@usuariocreacion,null,GETDATE(),null,1,'C')
end 

