using SistemaReparaciónDePC.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC
{
    public partial class Producto_Indez : System.Web.UI.Page
    {
        producto pro = new producto();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pro.CargarGriv(gvProducto, txtbuscar.Text);
            }
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            pro.CargarGriv(gvProducto, txtbuscar.Text);
        }

        protected void gvProducto_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProducto.PageIndex = e.NewPageIndex;
            pro.CargarGriv(gvProducto, txtbuscar.Text);
        }

        protected void btnmodal_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "showModal();", true);
        }
    }
}