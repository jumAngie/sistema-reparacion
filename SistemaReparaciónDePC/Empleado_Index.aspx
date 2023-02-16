<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Empleado_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Empleado_Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div cssclass="col-12 table-responsive-md table table-bordered table-striped" >       
   
                      
           <asp:GridView id ="gvEmpleado" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvEmpleado_PageIndexChanging" >                  
           <columns>
               <asp:BoundField HeaderText="Id Empleado" DataField="Empleado_Id" />
               <asp:BoundField HeaderText="Nombres" DataField="Empleado_Nombre" />
               <asp:BoundField HeaderText="Apellidos" DataField="Empleado_Apellido" />
               <asp:BoundField HeaderText="Identidad" DataField="Empleado_Identidad" />
               <asp:BoundField HeaderText="Estado civil" DataField="EstadoCivil_Descripcion" />
               <asp:BoundField HeaderText="Sexo" DataField="Empleado_Genero" />               
               <asp:BoundField HeaderText="Telefono" DataField="Empleado_Telefono" />                 
               <asp:BoundField HeaderText="Ciudad" DataField="Ciudad_Descripcion" />               
               <asp:BoundField HeaderText="Puesto" DataField="Empleado_Puesto" />
               <asp:TemplateField HeaderText="Editar">
                    <ItemTemplate>
                        <a class="fa fa-pencil btn btn-warning" style= "color:black"  onclick="Editar ('<%# Eval("Empleado_Id")%>')">Editar</a>
                    </ItemTemplate>                    
                </asp:TemplateField>    
                    <asp:TemplateField HeaderText="Eliminar">
                       <ItemTemplate>
                        <a class="fa fa-trash btn btn-danger" style= "color:black"  onclick="Eliminar('<%# Eval("Empleado_Id")%>')">Eliminar</a>
                    </Itemtemplate>
                    
              </asp:TemplateField> 
           
           </columns>
       </asp:GridView>


               <div class="form-group">
                    <label id ="lb1" text ="*" Visible ="false" runat ="server" ForeColor = "Red"></label>
                    <input type="text" class="form-control" placeholder="Buscar" required="" id ="txtbuscar" runat ="server">
                </div>
        
        


        <div>
         <button type="submit" class="btn btn-primary block full-width m-b" id="btnbuscar" runat ="server" onserverclick="btnbuscar_ServerClick">Buscar</button>
        </div>

        
        <%--<div>
        <button type="submit" class="btn btn-primary block full-width m-b" id="btnnuevo" runat ="server" onserverclick="btnnuevo_ServerClick1">Nuevo</button>
        </div>--%>
   
        
        <div>
        <button type="submit" class="btn btn-primary block full-width m-b" id="volver" runat ="server" onserverclick="volver_ServerClick">Volver</button>
        </div>
</asp:Content>
