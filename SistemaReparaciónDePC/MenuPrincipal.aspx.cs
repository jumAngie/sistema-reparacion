using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC
{
    public partial class MenuPrincipal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }

            if (Session["Admin"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }

            if (Session["ID"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
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

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            Session.Remove("ID");
            Session.Remove("Admin");
            Session.Remove("IdCliente_Editar");
            Response.Redirect("LogIn.aspx");
        }
    }
}