<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Departamentos_Index.aspx.cs" Inherits="SistemaReparaciónDePC.Departamentos_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <div class="row">
        <div class="col-sm-3"></div>

        <input type="button" class="btn btn-primary" value="Nuevo" onclick="showModal()" style="width: 100px">
        <div class="col-sm-1"></div>
        <asp:TextBox ID="txtbuscar" runat="server" Width="170px"></asp:TextBox>

        <asp:Button ID="btnbuscar" CssClass="btn btn-w-m btn-primary" runat="server" Text="Buscar.." Width="100px" OnClick="btnbuscar_Click" />
    </div>
    <br />
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="card">
            <div class="card-header" style="background-color: darkgoldenrod" text-align: center>
                <div class="row">
                    <div class="col-sm-5"></div>
                    <asp:Image ID="Image1" ImageUrl="Content/dist/img/logo-v2.png" runat="server" Height="80px" Width="80px" />
                </div>
                <div class="row">
                    <div class="col-sm-2"></div>
                    <h3 ><strong>Tabla de Departamentos</strong></h3>
                </div>
            </div>
            <div class="card-body">
                <asp:GridView ID="gvDeptos" CssClass="table table-bordered table-hover" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvDeptos_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="Departamento ID" DataField="Departamento_ID" />
                        <asp:BoundField HeaderText="Departamento" DataField="Departamento_Descripcion" />
                        <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <a class="btn btn-warning" style="color: black" onclick="Editar('<%# Eval("Departamento_ID")%>')">Editar</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalDepto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Departamentos</h5>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="row">
                            .
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 style="text-align: center">Ingrese los datos al formulario</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="col-sm-6">
                                            <a>Ingrese el Departamento</a>
                                            <asp:TextBox ID="txtDepto" CssClass="form-control" placeholder="Nuevo Departamento" runat="server" Width="418px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" runat="server" id="modalcerrar" onclick="hideModal()">Cerrar</button>
                        <asp:Button ID="btnCerrar" CssClass="btn btn-secondary" OnClick="btnCerrar_Click" runat="server" Visible="false" Text="Cerrar" />
                        <asp:Button ID="btnguardar" runat="server" CssClass="btn btn-w-m btn-primary" Text="Insertar" OnClick="btnguardar_Click"  />
                        <asp:Button ID="btneditar" runat="server" CssClass="btn btn-w-m btn-primary" Text="Editar" Visible="false" OnClick="btneditar_Click"  />

                    </div>
                </div>
            </div>
        </div>
    </div>



    <script src='Content/js/jquery-3.1.1.min.js'></script>
    <script src='Content/js/bootstrap.js'></script>

    <script>
        function showModal() {
            $("#ModalDepto").modal("show");
        }

        function hideModal() {
            $("#ModalDepto").modal("hide");
        }
        function refrescar() {
            window.location.href = "Departamentos_Index.aspx";
        }
    </script>
</asp:Content>
