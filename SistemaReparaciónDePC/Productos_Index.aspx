<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Productos_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Productos_Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="card-body">
        <div class="col-sm-6">                              
             <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="modal">
               Nuevo formulario
             </button>                                
        </div>    
   </div>
        
   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                              <input type="text" placeholder="Nuevo Producto" class="form-control" class="color"  id="txtproducto"   required autofocus />
                              </div>
                              <div class = col-sm-6>
                              <input type="Date" placeholder="Fecha" class="form-control" class="color"  id="txtfecha"   required autofocus />
                              </div>
                                                     
                            </div>    
                        </div>                               
                      </div>
                  </div>
               </div>
           </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"  id="modalcerrar">Close</button>
                <input type="button" class="btn btn-primary" value="guardar" id="btnguardar" >
              </div>          
     </div>        
  </div>
</div>   
        

</asp:Content>
