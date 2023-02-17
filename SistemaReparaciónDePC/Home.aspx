<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SistemaReparaciónDePC.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
        <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-1">¡Bienvenido!</h1>
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
    <section class="content">
      <div class="container-fluid">
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
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h5 class="card-title">Información General</h5>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <div class="btn-group">
                  </div>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-sm-1"></div>
                    <h2>Tienda de reparaciones para dispostivos electronicos "New-Tech"</h2>
                    </div>
                  <div class="row">
                  <div class="col-sm-2"></div>
                   
                    </div>
                  <div class="row">
                      <div class="col-sm-4"></div>
                      <img src="Content/dist/img/logo-v2.png" style="width: 300px; text-align: center;">
                  </div>
                  </div>
                </div>
              <br />
              <div class="row">
                  <div class="col-sm-4"></div>
                    <h2><strong>Administradores</strong></h2>
                    </div>
              <div class="row">
                  <div class="col-sm-1"></div>
                  <div class="col-md-4">
                      <!-- Widget: user widget style 2 -->
                      <div class="card card-widget widget-user-2">
                          <!-- Add the bg color to the header using any of the bg-* classes -->
                          <div class="widget-user-header bg-warning">
                              <div class="widget-user-image">
                                  <img class="img-circle elevation-2" src="https://st3.depositphotos.com/1532932/14126/v/450/depositphotos_141260440-stock-illustration-avatar-businesswoman-portraits-in-four.jpg" alt="User Avatar">
                              </div>
                              <!-- /.widget-user-image -->
                              <h3 class="widget-user-username">Angie Campos</h3>
                              <h5 class="widget-user-desc">Web Designer</h5>
                          </div>
                          <div class="card-footer p-0">
                              <ul class="nav flex-column">
                                  <li class="nav-item">
                                      <a href="#" class="nav-link">Projects <span class="float-right badge bg-primary">31</span>
                                      </a>
                                  </li>
                                  <li class="nav-item">
                                      <a href="#" class="nav-link">Tasks <span class="float-right badge bg-info">5</span>
                                      </a>
                                  </li>
                                  <li class="nav-item">
                                      <a href="#" class="nav-link">Completed Projects <span class="float-right badge bg-success">20</span>
                                      </a>
                                  </li>
                                  <li class="nav-item">
                                      <a href="#" class="nav-link">Followers <span class="float-right badge bg-danger">800</span>
                                      </a>
                                  </li>
                              </ul>
                          </div>
                      </div>
                  </div>
                  <!-- /.row -->
                
                    <div class="col-sm-1"></div>
                  <div class="col-md-4">
                      <!-- Widget: user widget style 2 -->
                      <div class="card card-widget widget-user-2">
                          <!-- Add the bg color to the header using any of the bg-* classes -->
                          <div class="widget-user-header bg-warning">
                              <div class="widget-user-image">
                                  <img class="img-circle elevation-2" src="https://st3.depositphotos.com/1532932/14125/v/450/depositphotos_141259424-stock-illustration-faceless-businessman-avatar-man-in.jpg" alt="User Avatar">
                              </div>
                              <!-- /.widget-user-image -->
                              <h3 class="widget-user-username">Juan Centeno</h3>
                              <h5 class="widget-user-desc">Lead Developer</h5>
                          </div>
                          <div class="card-footer p-0">
                              <ul class="nav flex-column">
                                  <li class="nav-item">
                                      <a href="#" class="nav-link">Projects <span class="float-right badge bg-primary">30</span>
                                      </a>
                                  </li>
                                  <li class="nav-item">
                                      <a href="#" class="nav-link">Tasks <span class="float-right badge bg-info">6</span>
                                      </a>
                                  </li>
                                  <li class="nav-item">
                                      <a href="#" class="nav-link">Completed Projects <span class="float-right badge bg-success">19</span>
                                      </a>
                                  </li>
                                  <li class="nav-item">
                                      <a href="#" class="nav-link">Followers <span class="float-right badge bg-danger">800</span>
                                      </a>
                                  </li>
                              </ul>
                          </div>
                      </div>
                  </div>
                  <!-- /.card-footer -->
              </div>
            <!-- /.card -->
          </div>
       
            
</asp:Content>
