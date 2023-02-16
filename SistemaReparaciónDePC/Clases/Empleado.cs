using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC.Clases
{
    public class Empleado
    {
        Utilitario util = new Utilitario();

        public void cargarGrid(GridView gv, string buscar)
        {
            if (buscar == "")
            {
                DataSet ds = util.ObtenerDatos("UDP_MostrarEmpleados", "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();
            }
            else
            {
                string sql = "UDP_BuscarEmpleados '" + buscar + "'";
                DataSet ds = util.ObtenerDatos(sql, "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();
            }
        }


    }
}