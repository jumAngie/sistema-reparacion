<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Reparacion_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Reparacion_Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
               <br />
   
    <div class="row">
            <div class="col-sm-1"></div>
         <asp:Button ID="btnuevo" runat="server" CssClass="btn btn-w-m btn-primary" Text="Nuevo" OnClick="btnuevo_Click1" Width="187px"/> 
        <div class="col-sm-1"></div>
        <asp:TextBox ID="txtbuscar" runat="server" Width="418px"></asp:TextBox>   
           
         <asp:Button ID="btnbuscar" CssClass="btn btn-w-m btn-primary" runat="server" Text="Buscar.." OnClick="btnbuscar_Click" Width="177px"/>
             <%--<asp:Button ID="volver" CssClass="btn btn-secondary" runat="server" Text="Volver"  Width="181px" OnClick="volver_ServerClick"/>--%>
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
                        <h3><strong>Tabla de Reparaciones</strong></h3>
                    </div>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvReparacion" CssClass="table table-bordered table-hover" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvReparacion_PageIndexChanging">
                        <Columns>
                            <asp:BoundField HeaderText="Reparacion ID" DataField="rep_ID" />
                            <asp:BoundField HeaderText="Tipo de Trabajo" DataField="tipo_Descripción" />
                            <asp:BoundField HeaderText="Producto" DataField="pro_Descripción" />
                            <asp:BoundField HeaderText="Cliente" DataField="Cliente_Nombre" />
                            <asp:BoundField HeaderText="Técnico Encargado" DataField="Empleado_Nombre" />
                            <asp:BoundField HeaderText="Estado de la Reparación" DataField="rep_EstadoReparacion" />

                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <a class="btn-sm btn-warning" style="color: black" onclick="Editar ('<%# Eval("rep_ID")%>')">Editar</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <a class="btn-sm btn-danger" style="color: black" onclick="Eliminar('<%# Eval("rep_ID")%>')">Eliminar</a>
                                </ItemTemplate>

                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
