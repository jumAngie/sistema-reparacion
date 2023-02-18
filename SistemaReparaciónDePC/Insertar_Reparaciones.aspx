<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Insertar_Reparaciones.aspx.cs" Inherits="SistemaReparaciónDePC.Insertar_Reparaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <section class="content">
     <br />
      <div class="container-fluid">
        <!-- SELECT2 EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Datos de : <strong>Repraciones</strong></h3><br />
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
                          <asp:Label ID="lbltipodetrabajor" ForeColor="Red" runat="server" Text="*" Visible="false"></asp:Label>
                          <label for="Depto">Tipo de trabajo:</label>
                          <asp:DropDownList ID="ddltipodetrabajo" CssClass="form-control" runat="server"></asp:DropDownList>
                      </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <asp:Label ID="lblproducto" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                       <label for="Deportes">Producto a reparar:</label>
                      <asp:DropDownList ID="ddlproducto" CssClass="form-control" runat="server"></asp:DropDownList> 
                </div>
            </div>
                <!-- /.form-group -->
            <!-- /.row -->
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Lblcliente" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label> 
                        <label for="Muni">Cliente:</label>
                        <asp:DropDownList ID="ddlcliente" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>           
                </div> 
                  
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Lblempleado" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label> 
                        <label for="Muni">Técnico Encargado:</label>
                        <asp:DropDownList ID="ddlempleado" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>           
                </div> 


                <div class="col-md-6">
                <asp:Label ID="lblreparacion" ForeColor="Red" runat="server" Text="*" Visible="false" ></asp:Label>
                    <label for="exampleInputEmail1">Estado de la reparacion:</label>
                    <input type="text" class="form-control" id="txtreparacion" placeholder="Ingrese del estado de la reparacion" runat="server">
                </div>
                </div>
            
          </div>
        </div>
          <!-- /.card-body -->
          <div class="card-footer">
                    <asp:Button ID="btnGuardar" CssClass="btn-lg btn-primary" runat="server" onclick="btnGuardar_Click" Text="Guardar" />
                    <asp:Button ID="btnEditar" CssClass="btn-lg btn-danger" Visible="false"  runat="server" OnClick="btnEditar_Click" Text="Editar" />
                    <%--<asp:Button ID="btnLimpiar" CssClass="btn-lg btn-warning" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" Width="114px" />--%>
          </div>
        </div>
  </section>           

</asp:Content>
