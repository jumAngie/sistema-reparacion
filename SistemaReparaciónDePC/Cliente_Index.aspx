<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Cliente_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Cliente_Index" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="row">
    <div class="col-sm-2"></div>
    
    <div class="col-sm-2"></div>
    
    <button type="submit" class="btn btn-secondary block full-width m-b" id="btnbuscar" runat="server" onserverclick="btnbuscar_ServerClick">Buscar</button>
    <button type="submit" class="btn btn-primary block full-width m-b" id="volver" runat="server" onserverclick="volver_ServerClick">Volver</button>
    </div>
   
    <div class="row">
        <div class="col-sm-1"></div>
                  <div class="col-md-2">
                      <button type="submit" class="btn btn-primary block full-width m-b" id="btnnuevo" runat="server" onserverclick="btnnuevo_ServerClick1" style="width:100px">Nuevo</button>
                      <input type="text" class="form-control" placeholder="Buscar" required="" id="txtbuscar" runat="server">

                      <br />
           <asp:GridView id ="gvCliente" Cssclass="col-12 table-responsive-md table table-bordered table-striped" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvCliente_PageIndexChanging" >                  
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
</div>
</asp:Content>
