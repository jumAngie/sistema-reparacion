<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SistemaReparaciónDePC.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
        <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-1"><strong>¡Bienvenido!</strong></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
 
        <!-- Info boxes -->
        <div class="row">
          <div class="col-sm-1"></div>
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-thumbs-up"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Pedidos Enviados</span>
                <span class="info-box-number">120</span>
              </div>
            </div>
          </div>
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Pedidos Recibidos</span>
                <span class="info-box-number">34</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Nuevos Clientes</span>
                <span class="info-box-number">20</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="card">
            <div class="card-header" style="background-color: teal">
                <div class="row">
                    <div class="col-sm-5"></div>
                   
                </div>
                <div class="row">
                    <div class="col-sm-3"></div>
                    <h3><strong>Sistema de Reparación:</strong> Computadoras, Tablets y Celulares</h3>
                </div>
            </div>
            <div class="card-body">
                
                <div class="row">
                 <div class="col-sm-3"></div>
                 <asp:Image ID="Image1" ImageUrl="Content/dist/img/logo-v2.png" runat="server" Height="350px" Width="350px" />
                     </div>
            </div>
        </div>
    </div>
              
       
            
</asp:Content>
