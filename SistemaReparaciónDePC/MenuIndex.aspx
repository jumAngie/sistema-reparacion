<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="MenuIndex.aspx.cs" Inherits="SistemaReparaciónDePC.MenuIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="row">
        <div class="col-sm-5"></div>
    <h2 class="mb-2" style="color:white"><strong>MENÚ</strong></h2>
        </div>
    <div class="card card-success">
        <div class="card-body">
            <div class="row">
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2 bg-gradient-dark">
                        
                            <asp:ImageButton ID="imgCLIENTES" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/CLIENTES.png" OnClick="ImageButton1_Click" />
                    </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2">
                       <asp:ImageButton ID="imgEmpleados" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/EMPLEADOS.png" OnClick="imgEmpleados_Click" />
                    </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2">
                        <asp:ImageButton ID="imgREPARACIONES" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/REPARACIONES.png" OnClick="imgREPARACIONES_Click"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2">
                        <asp:ImageButton ID="imgPRODUCTOS" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/PRODUCTOS.png" OnClick="imgPRODUCTOS_Click"/>
                        </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2">
                        <asp:ImageButton ID="imgSERVICIOS" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/SERVICIOS.png" OnClick="imgSERVICIOS_Click"/>
                    </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-4">
                    <div class="card mb-2">
                        <asp:ImageButton ID="imgUSUARIOS" CssClass="card-img-top" runat="server" ImageUrl="Content/dist/img/USUARIOS.png" OnClick="imgUSUARIOS_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>   
</script>
</asp:Content>
