using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaReparaciónDePC.Clases;

namespace SistemaReparaciónDePC
{
    public partial class TickectDeServicio : System.Web.UI.Page
    {
        string id = "";
        Servicios servi = new Servicios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    id = Session["ID_Servicios"].ToString();
                    if (id == "")
                    {
                        Response.Redirect("Servicios_Index.aspx");
                    }
                    else
                    {
                        servi.CargarTicket(gvTicketsServicios, id);
                    }

                }
                catch (Exception)
                {

                    Response.Redirect("Servicios_Index.aspx");
                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Servicios_Index.aspx");
        }

        protected void gvTicketsServicios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTicketsServicios.PageIndex = e.NewPageIndex;
            servi.CargarTicket(gvTicketsServicios, id);
        }
    }
}