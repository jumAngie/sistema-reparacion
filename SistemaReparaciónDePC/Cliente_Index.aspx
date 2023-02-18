<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Cliente_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Cliente_Index" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
   
    <div class="row">
        <div class="col-sm-1"></div>
        <asp:Button ID="btnuevo" runat="server" CssClass="btn btn-w-m btn-primary" Text="Nuevo" OnClick="btnnuevo_ServerClick1" Width="150px" />  
        <div class="col-sm-2"></div>
        <asp:TextBox ID="txtbuscar" runat="server" Width="418px"></asp:TextBox>   
           
         <asp:Button ID="btnbuscar" CssClass="btn btn-primary" runat="server" Text="Buscar.." OnClick="btnbuscar_ServerClick" Width="150px"/>
            </div>
            <br />
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="card">
            <div class="card-header" style="background-color: darkgoldenrod">
                <div class="row">
                    <div class="col-sm-5"></div>
                    <asp:Image ID="Image1" ImageUrl="Content/dist/img/logo-v2.png" runat="server" Height="80px" Width="80px" />
                </div>
                <div class="row">
                    <div class="col-sm-4"></div>
                    <h3><strong>Tabla de Clientes</strong></h3>
                </div>
            </div>
            <div class="card-body">
                <asp:GridView ID="gvCliente" CssClass="table table-bordered table-hover" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvCliente_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="Id Cliente" DataField="Cliente_Id" />
                        <asp:BoundField HeaderText="Nombres" DataField="Cliente_Nombre" />
                        <asp:BoundField HeaderText="Apellidos" DataField="Cliente_Apellido" />
                        <asp:BoundField HeaderText="Identidad" DataField="Cliente_Identidad" />
                        <asp:BoundField HeaderText="Estado civil" DataField="EstadoCivil_Descripcion" />
                        <asp:BoundField HeaderText="Sexo" DataField="Cliente_Genero" />
                        <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <a class="btn-sm btn-warning" style="color: black" onclick="Editar('<%# Eval("Cliente_Id")%>')">Editar</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <a class="btn-sm btn-danger" style="color: black" onclick="Eliminar('<%# Eval("Cliente_Id")%>')">Eliminar</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Productos">
                            <ItemTemplate>
                                <a class="btn-sm btn-secondary" style="color: black" onclick="Ticket('<%# Eval("Cliente_Id")%>')">Mostrar Productos</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
