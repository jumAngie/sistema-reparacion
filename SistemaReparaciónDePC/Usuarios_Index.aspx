<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Usuarios_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Usuarios_Index" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
   
    <div class="row">
        <div class="col-sm-3"></div>
        <asp:Button ID="btnuevo" runat="server" CssClass="btn btn-w-m btn-primary" Text="Nuevo"  Width="110px" OnClick="btnuevo_Click" />  
        <div class="col-sm-1"></div>
        <asp:TextBox ID="txtbuscar" runat="server" Width="260px"></asp:TextBox>   
           
         <asp:Button ID="btnbuscar" CssClass="btn btn-primary" runat="server" Text="Buscar.." Width="120px" OnClick="btnbuscar_Click"/>
            </div>
            <br />
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="card">
            <div class="card-header" style="background-color: darkgoldenrod">
                <div class="row">
                    <div class="col-sm-5"></div>
                    <asp:Image ID="Image1" ImageUrl="Content/dist/img/logo-v2.png" runat="server" Height="80px" Width="80px" />
                </div>
                <div class="row">
                    <div class="col-sm-3"></div>
                    <h3><strong>Tabla de Usuarios</strong></h3>
                </div>
            </div>
            <div class="card-body">
                <asp:GridView ID="gvUsuarios" CssClass="table table-bordered table-hover" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvUsuarios_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="Id Usuario" DataField="Usuario_UsuarioId" />
                        <asp:BoundField HeaderText="Usuario" DataField="Usuario_Usuario" />
                        <asp:BoundField HeaderText="Empleado" DataField="Empleado" />
                        <asp:BoundField HeaderText="Es Admin" DataField="Es Admin" />
                        <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <a class="btn-sm btn-warning" style="color: black" onclick="Editar('<%# Eval("Usuario_UsuarioId")%>')">Editar</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <a class="btn-sm btn-danger" style="color: black" onclick="Eliminar('<%# Eval("Usuario_UsuarioId")%>')">Eliminar</a>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
