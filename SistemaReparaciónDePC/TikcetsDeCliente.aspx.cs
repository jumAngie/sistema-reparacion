using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaReparaciónDePC.Clases;

namespace SistemaReparaciónDePC
{
    public partial class TikcetsDeCliente : System.Web.UI.Page
    {
        Cliente cl = new Cliente();
        string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                try
                {
                    id = Session["IdCliente_Editar"].ToString();
                    if (id == "")
                    {
                        Response.Redirect("Cliente_Index.aspx");
                    }
                    else
                    {
                        cl.CargarTicket(gvTickets, id);
                    }
                    
                }
                catch (Exception)
                {

                    Response.Redirect("Cliente_Index.aspx");
                }
                
            }
        }

        protected void gvTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTickets.PageIndex = e.NewPageIndex;
            cl.CargarTicket(gvTickets, id);
        }
    }
}