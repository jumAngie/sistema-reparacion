<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Cliente_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Cliente_Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h>holaaaa</h>   
    
    <div cssclass="col-12 table-responsive-md table table-bordered table-striped" >       
   
           
           
           <asp:GridView id ="gvCliente" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvCliente_PageIndexChanging" >                  
           <columns>
               <asp:BoundField HeaderText="Id Cliente" DataField="Emp_EmpleadoId" />
               <asp:BoundField HeaderText="Nombres" DataField="Emp_EmpleadoNombre" />
               <asp:BoundField HeaderText="Apellidos" DataField="Emp_EmpleadoApellido" />
               <asp:BoundField HeaderText="Identidad" DataField="Emp_Identidad" />
               <asp:BoundField HeaderText="Estado civil" DataField="Emp_EstadoCivilId" />
               <asp:BoundField HeaderText="Sexo" DataField="Emp_Genero" />               
               <asp:BoundField HeaderText="Telefono" DataField="Emp_Telefono" />                 
               <asp:BoundField HeaderText="Ciudad" DataField="Emp_CiudadId" />
               <asp:BoundField HeaderText="FechaNac" DataField="Emp_FechaNac" />
               <asp:TemplateField HeaderText="Editar">
                    <ItemTemplate>
                        <a class="fa fa-pencil btn btn-warning" style= "color:black"  onclick="Editar ('<%# Eval("Emp_EmpleadoId")%>')">Editar</a>
                    </ItemTemplate>                    
                </asp:TemplateField>    
                    <asp:TemplateField HeaderText="Eliminar">
                       <ItemTemplate>
                        <a class="fa fa-trash btn btn-danger" style= "color:black"  onclick="Eliminar('<%# Eval("Emp_EmpleadoId")%>')">Eliminar</a>
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
