using SistemaReparaciónDePC.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC
{
    public partial class Cliente_Index : System.Web.UI.Page
    {

        Cliente cli = new Cliente();

        protected void Page_Load(object sender, EventArgs e)
        {
            cli.CargarGriv(gvCliente,txtbuscar.Value);
        }

        protected void gvCliente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            gvCliente.PageIndex = e.NewPageIndex;
            cli.CargarGriv(gvCliente, txtbuscar.Value);
        }

        protected void btnbuscar_ServerClick(object sender, EventArgs e)
        {

            cli.CargarGriv(gvCliente, txtbuscar.Value);
        }

        protected void btnnuevo_ServerClick(object sender, EventArgs e)
        {

        }
        protected void volver_ServerClick(object sender, EventArgs e)
        {
            txtbuscar.Value = "";
            cli.CargarGriv(gvCliente,txtbuscar.Value);
        }
    }
}