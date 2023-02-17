<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Producto_Indez.aspx.cs" Inherits="SistemaReparaciónDePC.Producto_Indez" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="card-body">
       
   </div>
   <br />
   
    <div class="row">
            <div class="col-sm-1"></div>
        
        <input type="button" value="nuevo" onclick="showModal()" > 
        <asp:TextBox ID="txtbuscar" runat="server" Width="418px"></asp:TextBox>   
           
         <asp:Button ID="btnbuscar" CssClass="btn btn-w-m btn-primary" runat="server" Text="Buscar.." OnClick="btnbuscar_Click" Width="177px"/>
             <%--<asp:Button ID="volver" CssClass="btn btn-secondary" runat="server" Text="Volver"  Width="181px" OnClick="volver_ServerClick"/>--%>
            </div>
            <br />
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-md-2">
            <asp:GridView ID="gvProducto" CssClass="col-12 table-responsive-md table table-bordered table-striped" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvProducto_PageIndexChanging">
                <Columns>
                    <asp:BoundField HeaderText="Id Producto" DataField="pro_ID" />
                    <asp:BoundField HeaderText="Descripcion" DataField="pro_Descripción" />
                    <asp:BoundField HeaderText="Fecha" DataField="pro_FechaIngreso" />
                    
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <a class="fa fa-pencil btn btn-warning" style="color: black"  onclick="Editar  ('<%# Eval("pro_ID")%>')">Editar</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="fa fa-trash btn btn-danger" style="color: black" onclick="Eliminar('<%# Eval("pro_ID")%>')">Eliminar</a>
                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
        </div>    

   <div class="modal fade" id="ModalProducto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
     <div class="modal-content">
      <div class="modal-header">       
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
         <div class="modal-body">
          <div class = "row">  
           <div class="row">
             <%--<div class = col-sm-2>  </div>--%>
               <div class = col-sm-12>
                 <div class = "card">                            
                            <div class = "card-header">                           
                                <h4 style="text-align:center"> Ingrese sus datos al formulario</h4>                             
                            </div>
                            <div class = "card-body">                                                                                                          
                              <div class = col-sm-6>
                              <a> Ingrese un nuevo producto </a>
                              <asp:TextBox ID="txtproducto" placeholder="Nuevo Producto"  runat="server" Width="418px"></asp:TextBox>                                                      
                            </div>    
                        </div>                               
                      </div>
                  </div>
               </div>
           </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"  id="modalcerrar">Close</button>
                <asp:Button id="btnguardar" runat="server" CssClass="btn btn-w-m btn-primary" Text="Insertar"  OnClick="btnguardar_Click1"/>                            
                <asp:Button id="btneditar" runat="server" CssClass="btn btn-w-m btn-primary" Text="Editar"  OnClick="btneditar_Click"/>  
              
              </div>          
     </div>        
  </div>
</div>   

    <script src="Content/js/bootstrap.js"></script>
    <script src="Content/js/jquery-3.1.1.min.js"></script>
    
    <script>
         function showModal() {            
             $("#ModalProducto").modal("show");
         }

         function hideModal() {
             $("#ModalProducto").modal("hide");
         }
         function refrescar() {
             window.location.href = "Productos_Index.aspx";
         }

        

    </script> 
</asp:Content>
