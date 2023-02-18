using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaReparaciónDePC.Clases;

namespace SistemaReparaciónDePC
{
    public partial class TicketdeEmpleado : System.Web.UI.Page
    {
        Empleado emple = new Empleado();
        string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    id = Session["IdEmpleado_Editar"].ToString();
                    if (id == "")
                    {
                        Response.Redirect("Empleado_Index.aspx");
                    }
                    else
                    {
                        emple.CargarTicket(gvTicketsEmpleado, id);
                    }

                }
                catch (Exception)
                {

                    Response.Redirect("Empleado_Index.aspx");
                }

            }
        }

        protected void gvTicketsEmpleado_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTicketsEmpleado.PageIndex = e.NewPageIndex;
            emple.CargarTicket(gvTicketsEmpleado, id);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Empleado_Index.aspx");
        }
    }
}