<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuPrincipal.aspx.cs" Inherits="SistemaReparaciónDePC.MenuPrincipal" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="Content/dist/img/logo-v2.png" />
  <title>Reparaciones NewTech</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="Content/plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="Content/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
     <link rel="stylesheet" href="Content/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="Content/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="Content/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <link rel="stylesheet" href="Content/dist/css/adminlte.min.css">
    <link href="Content/dist/css/datagridview.css" rel="stylesheet" />
</head>
<form runat="server">
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__wobble" src="Content/dist/img/logo-v2.png" alt="AdminLTELogo" height="60" width="60">
  </div>
          <br>
    <div class="card-body">
    <div class="row">
      
        <div class="col-sm-5"></div>
        
    <h2 class="mb-2" style="color:white"><strong>MENÚ</strong></h2>
        <div class="col-sm-5"></div>
        </div>
    <div class="card card-success">
        
            <div class="row">
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2 bg-gradient-dark">
                        
                            <asp:ImageButton ID="imgCLIENTES" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/CLIENTES.png" OnClick="ImageButton1_Click" />
                    </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2">
                       <asp:ImageButton ID="imgEmpleados" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/EMPLEADOS.png" OnClick="imgEmpleados_Click" />
                    </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2">
                        <asp:ImageButton ID="imgREPARACIONES" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/REPARACIONES.png" OnClick="imgREPARACIONES_Click"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2">
                        <asp:ImageButton ID="imgPRODUCTOS" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/PRODUCTOS.png" OnClick="imgPRODUCTOS_Click"/>
                        </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2">
                        <asp:ImageButton ID="imgSERVICIOS" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/SERVICIOS.png" OnClick="imgSERVICIOS_Click"/>
                    </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2">
                        <asp:ImageButton ID="imgUSUARIOS" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/USUARIOS.png" OnClick="imgUSUARIOS_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
      
  </div>
</form>
<!-- ./wrapper -->
    
    <script src="Content/js/jquery-3.1.1.min.js"></script>
    
    <script src="Content/js/bootstrap.js"></script>
<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="Content/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="Content/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="Content/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="Content/dist/js/adminlte.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="Content/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="Content/plugins/raphael/raphael.min.js"></script>
<script src="Content/plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="Content/plugins/jquery-mapael/maps/usa_states.min.js"></script>
<script src="Content/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="Content/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="Content/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="Content/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="Content/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="Content/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<!-- ChartJS -->
<script src="Content/plugins/chart.js/Chart.min.js"></script>
