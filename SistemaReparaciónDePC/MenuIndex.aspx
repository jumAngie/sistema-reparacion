<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="MenuIndex.aspx.cs" Inherits="SistemaReparaciónDePC.MenuIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="row">
        <div class="col-sm-5"></div>
    <h2 class="mb-2" style="color:white"><strong>MENÚ</strong></h2>
        </div>
        <div class="card card-success">
          <div class="card-body">
            <div class="row">
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2 bg-gradient-dark">
                        <img class="card-img-top" id="ImagenClientes" src="Content/dist/img/CLIENTES.png" alt="Clientes" runat="server">
                        <div class="card-img-overlay d-flex flex-column justify-content-end">
                            <a href="Cliente_Index.aspx" style="color: white; text-align: center;">
                                <h4><strong>Tabla  Clientes</strong></h4>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2">
                        <img class="card-img-top" src="Content/dist/img/EMPLEADOS.png" alt="Empleados">
                        <div class="card-img-overlay d-flex flex-column justify-content-end">
                            <a href="#" style="color: white; text-align: center;">
                                <h4><strong>Tabla  Empleados</strong></h4>
                            </a>
                        </div>
                    </div>
                </div>
              <div class="col-md-12 col-lg-6 col-xl-4">
                <div class="card mb-2">
                  <img class="card-img-top" src="Content/dist/img/REPARACIONES.png" alt="Reparaciones">
                        <div class="card-img-overlay d-flex flex-column justify-content-end">
                            <a href="#" style="color: white; text-align: center;">
                                <h4><strong>Tabla  Reparaciones</strong></h4>
                            </a>
                        </div>
                </div>
              </div>
            </div>
              <div class="row">
                  <div class="col-md-12 col-lg-6 col-xl-4">
                      <div class="card mb-2">
                          <img class="card-img-top" src="Content/dist/img/PRODUCTOS.png" alt="Reparaciones">
                          <div class="card-img-overlay d-flex flex-column justify-content-end">
                              <a href="#" style="color: white; text-align: center;">
                                  <h4><strong>Tabla  Productos</strong></h4>
                              </a>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-12 col-lg-6 col-xl-4">
                      <div class="card mb-2">
                          <img class="card-img-top" src="Content/dist/img/SERVICIOS.png" alt="Reparaciones">
                          <div class="card-img-overlay d-flex flex-column justify-content-end">
                              <a href="#" style="color: white; text-align: center;">
                                  <h4><strong>Tabla  Servicios</strong></h4>
                              </a>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-12 col-lg-6 col-xl-4">
                      <div class="card mb-2">
                          <img class="card-img-top" src="Content/dist/img/USUARIOS.png" alt="Reparaciones">
                          <div class="card-img-overlay d-flex flex-column justify-content-end">
                              <a href="#" style="color: white; text-align: center;">
                                  <h4><strong>Tabla  Usuarios</strong></h4>
                              </a>
                          </div>
                      </div>
                  </div>
                  </div>
              </div>
          </div>
        </div>
      </div>
<script>

    function Clientes_Página()
    {
        location.href= "Home.aspx";
    }
    
</script>
</asp:Content>
