using SistemaReparaciónDePC.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC
{
    public partial class Empleado_Index : System.Web.UI.Page
    {
        Empleado emp = new Empleado();
        InsertarEmpleados ins = new InsertarEmpleados();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Session["IdEmpleado_Editar"] = "";
                emp.cargarGrid(gvEmpleado, txtbuscar.Value);
            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "EditarEmpleado")
                {
                    Session["IdEmpleado_Editar"] = eventargument;
                    Response.Redirect("InsertarEmpleados.aspx");

                }

                if (eventtarget == "EliminarEmpleado")
                {
                    Session["IdEmpleado_Editar"] = eventargument;
                    ins.Eliminar();
                    Response.Redirect("Empleado_Index.aspx");
                }
            }





        }

        protected void gvEmpleado_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEmpleado.PageIndex = e.NewPageIndex;
            emp.cargarGrid(gvEmpleado, txtbuscar.Value);
        }

        protected void btnbuscar_ServerClick(object sender, EventArgs e)
        {
            emp.cargarGrid(gvEmpleado, txtbuscar.Value);
        }

        protected void volver_ServerClick(object sender, EventArgs e)
        {
            txtbuscar.Value = "";
            emp.cargarGrid(gvEmpleado, txtbuscar.Value);
        }
    }
}