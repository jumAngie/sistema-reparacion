ALTER TABLE [dbo].[tbl_Empleados]
ADD CONSTRAINT PK_UsuarioCreacionID_tbl_usuario_id_usuarios FOREIGN KEY(Empleado_UsuarioCreacionId)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)
ALTER TABLE [dbo].[tbl_Empleados]
ADD CONSTRAINT PK_UsuarioModificacion_usuario_id_usuarios FOREIGN KEY  (Empleado_UsuarioModificacionId)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)

 alter table [dbo].[tbl_EstadoCivil]
add  CONSTRAINT PK_tblEstadoCivil_UsuarioCreacionID_tbl_usuario_id_usuarios FOREIGN KEY  (EstadoCivil_UsuarioCreacionID )  REFERENCES tbl_Usuarios(Usuario_UsuarioId)
alter table [dbo].[tbl_EstadoCivil]
add  CONSTRAINT PK_tblEstadoCivil_UsuarioModificacionID_tbl_usuario_id_usuarios FOREIGN KEY  (EstadoCivil_UsuarioModificacionId) REFERENCES tbl_Usuarios(Usuario_UsuarioId)

alter table tbl_Departamentos
add CONSTRAINT PK_UsuarioDepartamento_tbl_usuario_id_usuarios FOREIGN KEY  (UsuarioCreacionID)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)
alter table tbl_Departamentos
add CONSTRAINT PK_tbldepartamento_UsuarioModificacion_usuario_id_usuarios FOREIGN KEY  (Depto_UsuarioModificacionId)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)


alter table [dbo].[tbl_Ciudades]
add CONSTRAINT PK_tblciudad_UsuarioCreacionID_tbl_usuario_id_usuarios FOREIGN KEY(Ciudad_UsuarioCreacionId)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)
alter table [dbo].[tbl_Ciudades]
add CONSTRAINT PK_tblciudad_UsuarioModificacion_usuario_id_usuarios FOREIGN KEY  (Ciudad_UsuarioModificacionId)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)


Alter table tbl_Empleados
add CONSTRAINT PK_Empleos_UsuarioCreacionID_tbl_usuario_id_usuarios FOREIGN KEY(Empleado_UsuarioCreacionId)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)
Alter table tbl_Empleados
add CONSTRAINT PK_empleados_UsuarioModificacion_usuario_id_usuarios FOREIGN KEY  (Empleado_UsuarioModificacionId)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)

Alter table tbl_Cliente
add CONSTRAINT PK_Cliente_UsuarioCreacionID_tbl_usuario_id_usuarios FOREIGN KEY(Cliente_UsuarioCreacionId)REFERENCES tbl_Usuarios(Usuario_UsuarioId)
Alter table tbl_Cliente
add CONSTRAINT PK_Cliente_UsuarioModificacion_usuario_id_usuarios FOREIGN KEY  (Cliente_UsuarioModificacionId)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)

Alter table tbl_TipoDeTrabajo
add CONSTRAINT PK_TipoDeTrabajo_UsuarioCreacionID_tbl_usuario_id_usuarios FOREIGN KEY(UsuarioCreacion)REFERENCES tbl_Usuarios(Usuario_UsuarioId)
Alter table tbl_TipoDeTrabajo
add CONSTRAINT PK_TipoDeTrabajo_UsuarioModificacion_usuario_id_usuarios FOREIGN KEY  (UsuarioModificacion)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)

Alter table tbl_Producto
add CONSTRAINT PK_Producto_UsuarioCreacionID_tbl_usuario_id_usuarios FOREIGN KEY(UsuarioCreacion)REFERENCES tbl_Usuarios(Usuario_UsuarioId)
Alter table tbl_Producto
add CONSTRAINT PK_Producto_UsuarioModificacion_usuario_id_usuarios FOREIGN KEY  (UsuarioModificacion)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)

Alter table tbl_Reparaci�n
add CONSTRAINT PK_tbl_Reparaci�n_UsuarioCreacionID_tbl_usuario_id_usuarios FOREIGN KEY(UsuarioCreacion)REFERENCES tbl_Usuarios(Usuario_UsuarioId)
Alter table tbl_Reparaci�n
add CONSTRAINT PK_tbl_Reparaci�n_UsuarioModificacion_usuario_id_usuarios FOREIGN KEY  (UsuarioModificacion)  REFERENCES tbl_Usuarios(Usuario_UsuarioId)
