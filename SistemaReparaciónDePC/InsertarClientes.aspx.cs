using SistemaReparaciónDePC.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC
{
    public partial class InsertarClientes : System.Web.UI.Page
    {
        Cliente cli = new Cliente();
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if(!IsPostBack)
            {
                cli.DdlEstado(ddlestadocivil);
                cli.ddldepto(ddlDepartamento);

            }
        }

        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            cli.ddlmuni(ddlCiudad, ddlDepartamento.SelectedValue);
        }
    }
}