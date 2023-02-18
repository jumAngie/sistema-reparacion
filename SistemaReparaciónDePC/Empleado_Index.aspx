<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Empleado_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Empleado_Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
    
    <div class="row">
        <div class="col-sm-1"></div>
        <asp:Button ID="btnuevo" runat="server" CssClass="btn btn-w-m btn-primary" Text="Nuevo" OnClick="btnuevo_Click" Width="150px" />  
        <div class="col-sm-3"></div>
        <asp:TextBox ID="txtbuscar" runat="server" Width="350px"></asp:TextBox> 

        <asp:Button ID="btnbuscar" CssClass="btn btn-primary" runat="server" Text="Buscar.." OnClick="btnbuscar_ServerClick"  Width="150px"/>
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
                    <h3><strong>Tabla de Empleados</strong></h3>
                </div>
            </div>
            <div class="card-body">
                <asp:GridView ID="gvEmpleado" CssClass="table table-bordered table-hover" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvEmpleado_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="Id Empleado" DataField="Empleado_Id" />
                        <asp:BoundField HeaderText="Nombres" DataField="Empleado_Nombre" />
                        <asp:BoundField HeaderText="Apellidos" DataField="Empleado_Apellido" />
                        <asp:BoundField HeaderText="Identidad" DataField="Empleado_Identidad" />
                        <asp:BoundField HeaderText="Estado civil" DataField="EstadoCivil_Descripcion" />
                        <asp:BoundField HeaderText="Sexo" DataField="Empleado_Genero" />
                        <asp:BoundField HeaderText="Telefono" DataField="Empleado_Telefono" />
                        <asp:BoundField HeaderText="Puesto" DataField="Empleado_Puesto" />
                        <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <a class="btn-sm btn-warning" style="color: black" onclick="EditarEmpleado('<%#Eval("Empleado_Id")%>')">Editar</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <a class="btn-sm btn-danger" style="color: black" onclick="EliminarEmpleado('<%#Eval("Empleado_Id")%>')">Eliminar</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
