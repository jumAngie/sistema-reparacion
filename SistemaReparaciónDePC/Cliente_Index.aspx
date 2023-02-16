<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Cliente_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Cliente_Index" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
   
    <div class="row">
            <div class="col-sm-1"></div>
         <asp:Button ID="btnuevo" runat="server" CssClass="btn btn-w-m btn-primary" Text="Nuevo" OnClick="btnnuevo_ServerClick1" Width="187px"/>  
        <asp:TextBox ID="txtbuscar" runat="server" Width="418px"></asp:TextBox>   
           
         <asp:Button ID="btnbuscar" CssClass="btn btn-w-m btn-primary" runat="server" Text="Buscar.." OnClick="btnbuscar_ServerClick" Width="177px"/>
             <asp:Button ID="volver" CssClass="btn btn-secondary" runat="server" Text="Volver"  Width="181px" OnClick="volver_ServerClick"/>
            </div>
            <br />
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-md-2">
            <asp:GridView ID="gvCliente" CssClass="col-12 table-responsive-md table table-bordered table-striped" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvCliente_PageIndexChanging">
                <Columns>
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
                            <a class="fa fa-pencil btn btn-warning" style="color: black" onclick="Editar ('<%# Eval("Cliente_Id")%>')">Editar</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="fa fa-trash btn btn-danger" style="color: black" onclick="Eliminar('<%# Eval("Cliente_Id")%>')">Eliminar</a>
                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
        </div>
</asp:Content>
