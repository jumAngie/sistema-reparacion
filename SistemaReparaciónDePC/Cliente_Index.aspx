<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Cliente_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Cliente_Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h>holaaaa</h>   
    
    <div cssclass="col-12 table-responsive-md table table-bordered table-striped" >       
   
           
           
           <asp:GridView id ="gvCliente" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvCliente_PageIndexChanging" >                  
           <columns>
               <asp:BoundField HeaderText="Id Cliente" DataField="Cliente_Id" />
               <asp:BoundField HeaderText="Nombres" DataField="Cliente_Nombre" />
               <asp:BoundField HeaderText="Apellidos" DataField="Cliente_Apellido" />
               <asp:BoundField HeaderText="Identidad" DataField="Cliente_Identidad" />
               <asp:BoundField HeaderText="Estado civil" DataField="EstadoCivil_Descripcion" />
               <asp:BoundField HeaderText="Sexo" DataField="Cliente_Genero" />               
               <asp:BoundField HeaderText="Telefono" DataField="Cliente_Telefono" />                 
               <asp:BoundField HeaderText="Ciudad" DataField="Ciudad_Descripcion" />               
               <asp:TemplateField HeaderText="Editar">
                    <ItemTemplate>
                        <a class="fa fa-pencil btn btn-warning" style= "color:black"  onclick="Editar ('<%# Eval("Cliente_Id")%>')">Editar</a>
                    </ItemTemplate>                    
                </asp:TemplateField>    
                    <asp:TemplateField HeaderText="Eliminar">
                       <ItemTemplate>
                        <a class="fa fa-trash btn btn-danger" style= "color:black"  onclick="Eliminar('<%# Eval("Cliente_Id")%>')">Eliminar</a>
                    </Itemtemplate>
                    
              </asp:TemplateField> 
           
           </columns>
       </asp:GridView>


               <div class="form-group">
                    <label id ="lb1" text ="*" Visible ="false" runat ="server" ForeColor = "Red"></label>
                    <input type="text" class="form-control" placeholder="Buscar" required="" id ="txtbuscar" runat ="server">
                </div>
          
         <button type="submit" class="btn btn-primary block full-width m-b" id="btnbuscar" runat ="server" onserverclick="btnbuscar_ServerClick">Buscar</button>
        </div>

        
        <div>
        <button type="submit" class="btn btn-primary block full-width m-b" id="btnnuevo" runat ="server" onserverclick="btnnuevo_ServerClick">Nuevo</button>
        </div>
   
    












</asp:Content>
