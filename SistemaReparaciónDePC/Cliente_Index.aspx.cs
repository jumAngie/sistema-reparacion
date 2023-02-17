using SistemaReparaciónDePC.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC
{
    public partial class Cliente_Index : System.Web.UI.Page
    {

        Cliente cli = new Cliente();
        InsertarClientes ins = new InsertarClientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!IsPostBack)
            {
                Session["IdCliente_Editar"] = "";
                cli.CargarGriv(gvCliente,txtbuscar.Text);
            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "Editar")
                {
                    Session["IdCliente_Editar"] = eventargument;
                    Response.Redirect("InsertarClientes.aspx");

                }

                if (eventtarget == "Eliminar")
                {
                    Session["IdCliente_Editar"] = eventargument;
                    ins.eliminar();
                    cli.CargarGriv(gvCliente, txtbuscar.Text);
                    
                }
            }



        }

        protected void gvCliente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            gvCliente.PageIndex = e.NewPageIndex;
            cli.CargarGriv(gvCliente, txtbuscar.Text);
        }

        protected void btnbuscar_ServerClick(object sender, EventArgs e)
        {

            cli.CargarGriv(gvCliente, txtbuscar.Text);
        }

        protected void btnnuevo_ServerClick(object sender, EventArgs e)
        {

        }

        protected void btnnuevo_ServerClick1(object sender, EventArgs e)
        {
            Response.Redirect("InsertarClientes.aspx");
        }
        
    
    
    
    }
}