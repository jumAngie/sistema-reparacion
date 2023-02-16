<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="InsertarClientes.aspx.cs" Inherits="SistemaReparaciónDePC.InsertarClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <section class="content">
     <br />
      <div class="container-fluid">
        <!-- SELECT2 EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Datos de : <strong>Clientes</strong></h3><br />
            <asp:Label ID="Advertencia" ForeColor="Red" runat="server" Text="*No se pudieron ingresar los datos" Visible="false" ></asp:Label>
  
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
                  <asp:Label ID="lblNombre" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputEmail1">Nombre del Cliente</label>
                    <input type="text" class="form-control" id="txtnombre" placeholder="Ingrese el nombre del Cliente" runat="server">
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <asp:Label ID="lblidentidad" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputEmail1">Identidad del Cliente</label>
                    <input type="text" class="form-control" id="txtIdentidad" placeholder="Ingrese la identidad del cliente" runat="server">
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <asp:Label ID="lblapellido" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputEmail1">Apellido del Empleado</label>
                    <input type="text" class="form-control" id="txtapellido" placeholder="Ingrese el Apellido del Empleado" runat="server">
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <asp:Label ID="lblEstado" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                       <label for="Deportes">EstadoCivil:</label>
                      <asp:DropDownList ID="ddlestadocivil" CssClass="form-control" runat="server"></asp:DropDownList> 
                </div>

                  <div class="col-12 col-sm-6">
                               <asp:Label ID="lblSexo" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                              <div class="form-group">
                                  <label for="sexo">Sexo:</label>
                                  <label>F</label>
                                  <input type="radio" placeholder="Femenino" id="radiof" name="rdsexo" value="F" runat="server">
                                  <label>M</label>
                                  <input type="radio" placeholder="Masculino" id="radiom" name="rdsexo" value="M" runat="server">
                              </div>
                              <!-- /.form-group -->
                          </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
             <div class="col-12 col-sm-6">
                      <div class="form-group">
                          <asp:Label ID="lblLugar" ForeColor="Red" runat="server" Text="*" Visible="false"></asp:Label>
                          <label for="Depto">Lugar del Cliente (Departamento, Ciudad):</label>
                          <asp:DropDownList ID="ddlDepartamento" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlDepartamento_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                      </div>
                  </div>
                 
                  <div class="col-12 col-sm-6">
                      <div class="form-group">
                          <asp:DropDownList ID="ddlMuni" CssClass="form-control" runat="server"></asp:DropDownList>
                      </div>
                      </div>
                      <div class="col-12 col-sm-6">
                          <div class="form-group">
                              <asp:Label ID="lbltelefono" ForeColor="Red" runat="server" Text="*" Visible="false"></asp:Label>
                              <label for="exampleInputEmail1">Telefono</label>
                              <input type="text" class="form-control" id="txttelefono" placeholder="Ingrese el telefono del Cliente" runat="server">
                          </div>
                      </div>
                      <!-- /.col -->
                  
            <!-- /.row -->
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
                    <asp:Button ID="btnGuardar" CssClass="btn btn-primary" runat="server" onclick="btnGuardar_Click" Text="Guardar" />
                    <asp:Button ID="btnEditar" CssClass="btn btn-danger" Visible="false"  runat="server" OnClick="btnEditar_Click" Text="Editar" />
                    <asp:Button ID="btnLimpiar" CssClass="btn btn-warning" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" />
          </div>
        </div>
      </div>
  </section> 


</asp:Content>
