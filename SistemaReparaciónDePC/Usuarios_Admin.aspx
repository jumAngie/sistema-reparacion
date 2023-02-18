<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Usuarios_Admin.aspx.cs" Inherits="SistemaReparaciónDePC.Usuarios_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
     <br />
      <div class="container-fluid">
        <!-- SELECT2 EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Datos de : <strong>Usuarios</strong></h3><br />
            <asp:Label ID="Advertencia" ForeColor="Red" runat="server" Text="No se pudieron ingresar los datos" Visible="false" ></asp:Label>
             
            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
              <button type="button" class="btn btn-tool" data-card-widget="remove">
                <i class="fas fa-times"></i>
              </button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <asp:Label ID="lblUsuario" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputEmail1">Usuario</label>
                    <asp:Label ID="lblUsuarioRepetido" ForeColor="Red" runat="server" Text="*El Usuario ya existe" Visible="false" ></asp:Label>
                    <input type="text" class="form-control" id="txtUsuario" placeholder="Ingrese el Usuario" runat="server">
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <asp:Label ID="lblEmpleado" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                       <label for="Usuarios">Empleado:</label>
                      <asp:DropDownList ID="ddlEmpleado" CssClass="form-control" runat="server"></asp:DropDownList> 
                </div>
                <!-- /.form-group -->
              </div>
                <div class="col-md-6">
                <div class="form-group">
                  <asp:Label ID="lblContraseña" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputEmail1">Contraseña</label>
                    <input type="text" class="form-control" id="txtContraseña" placeholder="Ingrese la contraseña" runat="server">
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <asp:Label ID="lblEsAdmin" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputEmail1">Es Admin:</label>
                    <asp:CheckBox ID="ckAdmin" runat="server" />
                </div>
                <!-- /.form-group -->
              </div>
                </div>
                </div>
          <!-- /.card-body -->
          <div class="card-footer">
                    <asp:Button ID="btnGuardar" CssClass="btn-lg btn-primary" runat="server" OnClick="btnGuardar_Click"  Text="Guardar" />
                    <asp:Button ID="btnEditar" CssClass="btn-lg btn-danger" Visible="false" OnClick="btnEditar_Click" runat="server" Text="Editar" />
                    <asp:Button ID="btnLimpiar" CssClass="btn-lg btn-warning" runat="server"  Text="Limpiar" />
          </div>
        </div>
  </section> 
</asp:Content>
