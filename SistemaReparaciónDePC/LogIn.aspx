<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="SistemaReparaciónDePC.LogIn" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>NEW-TECH LOGIN</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="Content/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="Content/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="Content/dist/css/adminlte.min.css">
   <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
</head>
<form runat="server">
    <body class="hold-transition login-page">
        <div class="login-box">
            <!-- /.login-logo -->

            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                    <div class="row">
                        <div class="col-sm-4"></div>
                    <asp:Image ID="img" ImageUrl="~/Content/dist/img/logo-v2.png" Width="100px" runat="server"/>
                        </div>
                    <a href="#" class="h1"><b>Login</b>N-TCH</a>
                </div>
                <div class="card-body">
                    <p class="login-box-msg"><strong>Ingrese los datos de su cuenta</strong></p>
                    <asp:Label ID="lblDatos" runat="server" Text="*Datos Incorrectos" ForeColor="RoyalBlue" Visible="false"></asp:Label>
                    <div class="input-group mb-3">
                         <asp:Label ID="lblUsu" runat="server" Text="*" ForeColor="RoyalBlue" Visible="false"></asp:Label>
                        <input type="text" class="form-control" placeholder="Usuario" id="txtUsu" runat="server">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <asp:Label ID="lblContra" runat="server" Text="*" ForeColor="RoyalBlue" Visible="false"></asp:Label>
                        <input type="password" class="form-control" placeholder="Password" id="txtContra" runat="server">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- /.col -->
                        <div class="col-sm-4"></div>
                            <asp:Button ID="btnIngresar" CssClass="btn btn-block btn-info" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" />  
                        <!-- /.col -->
                    </div>
                    <!-- /.social-auth-links -->
                    <p class="mb-0">
                        <br />
                        <a href="Restablecer_Contraseña.aspx" class="text-center">Restablecer Contraseña</a>
                    </p>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
</form>
<!-- /.login-box -->


<!-- jQuery -->
<script src="Content/Toast.js/Toast.js"></script>
<script src="Content/plugins/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<!-- Bootstrap 4 -->
<script src="Content/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="Content/dist/js/adminlte.min.js"></script>
</body>
</html>