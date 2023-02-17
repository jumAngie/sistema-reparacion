using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC
{
    public partial class MenuIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Cliente_Index.aspx");
        }

        protected void imgEmpleados_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Empleado_Index.aspx");
        }

        protected void imgREPARACIONES_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Reparacion_Index.aspx");
        }

        protected void imgPRODUCTOS_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Producto_Indez.aspx");
        }

        protected void imgSERVICIOS_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("");
        }

        protected void imgUSUARIOS_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Usuarios_Index.aspx");
        }
    }
}