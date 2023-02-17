<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Reparacion_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Reparacion_Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
               <br />
   
    <div class="row">
            <div class="col-sm-1"></div>
         <asp:Button ID="btnuevo" runat="server" CssClass="btn btn-w-m btn-primary" Text="Nuevo" OnClick="btnuevo_Click" Width="187px"/>  
        <asp:TextBox ID="txtbuscar" runat="server" Width="418px"></asp:TextBox>   
           
         <asp:Button ID="btnbuscar" CssClass="btn btn-w-m btn-primary" runat="server" Text="Buscar.." OnClick="btnbuscar_Click" Width="177px"/>
             <%--<asp:Button ID="volver" CssClass="btn btn-secondary" runat="server" Text="Volver"  Width="181px" OnClick="volver_ServerClick"/>--%>
            </div>
            <br />
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-md-2">
            <asp:GridView ID="gvReparacion" CssClass="col-12 table-responsive-md table table-bordered table-striped" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvReparacion_PageIndexChanging">
                <Columns>
                    <asp:BoundField HeaderText="ReparacionID" DataField="rep_ID" />
                    <asp:BoundField HeaderText="Tipo de Trabajo" DataField="tipo_Descripción" />
                    <asp:BoundField HeaderText="Producto" DataField="pro_Descripción" />
                    <asp:BoundField HeaderText="Cliente" DataField="Cliente_Nombre" />
                    <asp:BoundField HeaderText="Técnico Encargado" DataField="Empleado_Nombre" />
                    <asp:BoundField HeaderText="rep_EstadoReparacion" DataField="rep_EstadoReparacion" />
                  
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <a class="fa fa-pencil btn btn-warning" style="color: black" onclick="Editar ('<%# Eval("rep_ID")%>')">Editar</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="fa fa-trash btn btn-danger" style="color: black" onclick="Eliminar('<%# Eval("rep_ID")%>')">Eliminar</a>
                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
        </div>

</asp:Content>
