<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Restablecer_Contraseña.aspx.cs" Inherits="SistemaReparaciónDePC.Restablecer_Contraseña" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Restablecer Contraseña</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="Content/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="Content/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="Content/dist/css/adminlte.min.css">
</head>
<form runat="server">
<body class="hold-transition login-page">
<div class="login-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
        <div class="row">
            <div class="col-sm-4"></div>
     <asp:Image ID="img" ImageUrl="~/Content/dist/img/logo-v2.png" Width="100px" runat="server"/>
            </div>
      <a href="#" class="h1"><b>Admin</b>N-TECH</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg"><strong>Ingrese su Usuario para restablecer su contraseña:</strong></p>
        
        <asp:Label ID="lblErrorUsuario" runat="server" Text="* Usuario no existente" ForeColor="Red" Visible="false"></asp:Label>
        <div class="input-group mb-3">
          <input type="text" class="form-control" runat="server" id="txtUsuario" placeholder="Usuario">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
            <asp:Label ID="lblContraseña" runat="server" Text="*" ForeColor="Red" Visible="false"></asp:Label>
          <asp:Label ID="lbl1" runat="server" Text="Ingrese una nueva contraseña:"></asp:Label>
          <div class="input-group mb-3">
              <br />
         
          <input type="text" class="form-control" runat="server" id="txtContraseña" placeholder="Contraseña">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-key"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
              <asp:Button ID="btnRestablecer" runat="server" Text="Restablecer Contraseña" CssClass="btn btn-primary" OnClick="btnRestablecer_Click" />
          </div>
          <!-- /.col -->
        </div>
      <p class="mt-3 mb-1">
        <a href="LogIn.aspx"> Ir a Login</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->
</form>
<!-- jQuery -->
<script src="Content/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="Content/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="Content/dist/js/adminlte.min.js"></script>
</body>
</html>
