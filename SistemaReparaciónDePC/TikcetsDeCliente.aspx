<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="TikcetsDeCliente.aspx.cs" Inherits="SistemaReparaciónDePC.TikcetsDeCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br>
   <div class="card">
    <div class="card-header" style="background-color:darkgoldenrod">
        <h3>Productos por Clientes</h3>
    </div>
    <div class="card-body">
        <asp:GridView ID="gvTickets" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField DataField="Cliente ID" HeaderText="Nombre" />
                <asp:BoundField DataField="Producto" HeaderText="Edad" />
                <asp:BoundField DataField="Estado" HeaderText="Edad" />
            </Columns>
        </asp:GridView>
    </div>
</div>
</asp:Content>
