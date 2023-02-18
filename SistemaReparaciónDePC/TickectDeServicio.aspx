<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="TickectDeServicio.aspx.cs" Inherits="SistemaReparaciónDePC.TickectDeServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br>
<div class="row">
    <div class="col-sm-4"></div>
    <div class="card">
        <div class="card-header" style="background-color: darkgoldenrod">
            <div class="row">
                <div class="col-sm-5"></div>
                <asp:Image ID="Image1" ImageUrl="Content/dist/img/logo-v2.png" runat="server" Height="80px" Width="80px" />
            </div>
            <div class="row">
                <div class="col-sm-1"></div>
                <h3><strong>Ticket de Productos por Servicio</strong></h3>
            </div>
        </div>
        <div class="card-body">
            <asp:GridView ID="gvTicketsServicios" runat="server" AllowPaging="true" AutoGenerateColumns="False" HeaderStyle-BackColor="darkgoldenrod" CssClass="table table-bordered table-hover" OnPageIndexChanging="gvTicketsServicios_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="tipo_Descripción" HeaderText="Servicio" />
                    <asp:BoundField DataField="pro_Descripción" HeaderText="Producto" />
                    <asp:BoundField DataField="rep_EstadoReparacion" HeaderText="Estado de la Reparacion" />
                </Columns>
            </asp:GridView>
            <div class="row">
                <div class="col-sm-5"></div>
                <asp:Button ID="btnVolver" CssClass="btn btn-secondary" runat="server" Text="Atrás" OnClick="btnVolver_Click"/>

            </div>
        </div>
    </div>
</div>
</asp:Content>
