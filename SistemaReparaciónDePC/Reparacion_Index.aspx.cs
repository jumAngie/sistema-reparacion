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
        Insertar_Reparaciones ir = new Insertar_Reparaciones();
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                Session["IdReparacion_Editar"] = "";
                rep.CargarGriv(gvReparacion, txtbuscar.Text);
             
            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "Editar")
                {
                    Session["IdReparacion_Editar"] = eventargument;
                    Response.Redirect("Insertar_Reparaciones.aspx");
                }

                if (eventtarget == "Eliminar")
                {
                    Session["IdReparacion_Editar"] = eventargument;
                    ir.ELIMINAR();
                    Response.Redirect("Reparacion_Index.aspx");
                }
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
       
        protected void btnuevo_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Insertar_Reparaciones.aspx");
        }
    }
}