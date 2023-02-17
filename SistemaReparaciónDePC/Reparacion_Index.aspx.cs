using SistemaReparaciónDePC.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC
{
    public partial class Reparacion_Index : System.Web.UI.Page
    {
        Reparacion rep = new Reparacion();
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            { 
            rep.CargarGriv(gvReparacion, txtbuscar.Text);
            }
        }

        protected void gvReparacion_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvReparacion.PageIndex = e.NewPageIndex;
            rep.CargarGriv(gvReparacion, txtbuscar.Text);
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            rep.CargarGriv(gvReparacion, txtbuscar.Text);
        }

        protected void btnuevo_Click(object sender, EventArgs e)
        {

        }
    }
}