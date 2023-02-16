<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="InsertarClientes.aspx.cs" Inherits="SistemaReparaciónDePC.InsertarClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <div class="col-sm-3"></div>
          <!-- left column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Datos Eventos</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
                <div class="card-body">
                  <div class="form-group">
                      <asp:Label ID="lblNombre" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputEmail1">Nombre del Cliente</label>
                    <input type="text" class="form-control" id="txtnombre" placeholder="Ingrese el nombre del Cliente" runat="server">
                  </div>
                  <div class="form-group">
                      <asp:Label ID="lblapellido" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputEmail1">Apellido del Empleado</label>
                    <input type="text" class="form-control" id="txtapellido" placeholder="Ingrese el Apellido del Empleado" runat="server">
                  </div>
                  <div class="form-group">
                      <asp:Label ID="lblidentidad" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputEmail1">Identidad del Cliente</label>
                    <input type="text" class="form-control" id="txtIdentidad" placeholder="Ingrese la identidad del cliente" runat="server">
                  </div>
                   <div class="form-group">
                      <asp:Label ID="lblEstado" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                       <label for="Deportes">EstadoCivil:</label>
                      <asp:DropDownList ID="ddlestadocivil" CssClass="form-control" runat="server"></asp:DropDownList>                      
                  </div>
              <div class="form-group">                  
                  <label for="sexo">Sexo:</label>
                  <div class="col-sm-6">
                  <label>F</label>
                  <input type="radio" placeholder="Femenino" class="form-control" id="radiof" name="rdsexo" value="F" runat="server" style="width:50px;height:50px">
                  </div>                                          
                  <div class="col-sm-6">
                  <label>M</label>
                  <input type="radio" placeholder="Masculino" class="form-control" id="radiom" name="rdsexo" value="M" runat="server" style="width:50px;height:50px" >
                  </div>                     
              </div>
                  
                    <div class="form-group">
                      <asp:Label ID="lbltelefono" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputEmail1">Telefono</label>
                    <input type="text" class="form-control" id="txttelefono" placeholder="Ingrese el telefono del Cliente" runat="server">
                  </div>
                    <div class="form-group">
                      <asp:Label ID="lblLugar" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                       <label for="Depto">Lugar del Evento (Departamento, Ciudad):</label>
                      <asp:DropDownList ID="ddlDepartamento"  CssClass="form-control" runat="server"  OnSelectedindexChanged="ddlDepartamento_SelectedIndexChanged"  AutoPostBack="true"></asp:DropDownList>
                      <asp:DropDownList ID="ddlMuni" CssClass="form-control" runat="server"></asp:DropDownList>
                  </div>

                    <div class="form-group">
                         <asp:Label ID="Advertencia" ForeColor="Red" runat="server" Text="No se pudieron ingresar los datos" Visible="false" ></asp:Label>
                  </div>


                   <%--                   
                   <div class="form-group">
                      <asp:Label ID="lblFecha" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputPassword1">Fecha del Evento:</label>
                    <input type="date" class="form-control" id="txtDate" placeholder="Ingrese la fecha del Evento" runat="server">
                  </div>
                    
                    <div class="form-group">
                      <asp:Label ID="lblEmpleados" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                       <label for="Empleados">Observador:</label>
                      <asp:DropDownList ID="ddlObservador" CssClass="form-control" runat="server"></asp:DropDownList>
                        <label for="Empleados">Juez:</label>
                      <asp:DropDownList ID="ddlJuez" CssClass="form-control" runat="server"></asp:DropDownList>
                  </div>
                    <div class="form-group">
                      <asp:Label ID="lblDeportes" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                       <label for="Deportes">Deporte:</label>
                      <asp:DropDownList ID="ddlDeporte" CssClass="form-control" runat="server"></asp:DropDownList>
                      <asp:Label ID="lblDuracion" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                        <label for="Duracion">Duración del Evento (Horas):</label>
                        <asp:TextBox ID="txtDuracion" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>--%>
                </div>
                <div class="card-footer">                   
                    <asp:Button ID="btnGuardar" CssClass="btn btn-primary" runat="server" onclick="btnGuardar_Click" Text="Guardar" />
                    <asp:Button ID="btnEditar" CssClass="btn btn-danger" Visible="false"  runat="server" Text="Editar" />
                    <asp:Button ID="btnLimpiar" CssClass="btn btn-warning" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" />
                </div>             
            </div>
        </div>
        </div>



</asp:Content>
