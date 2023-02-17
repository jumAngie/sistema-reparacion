using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC
{
    public partial class PaginaMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["Usuario"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }

           if(Session["Admin"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }

            if (Session["ID"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            Session.Remove("ID");
            Session.Remove("Admin");
            Response.Redirect("LogIn.aspx");
        }
    }
}