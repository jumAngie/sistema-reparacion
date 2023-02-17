using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC.Clases
{
    public class Reparacion
    {
        Utilitario util = new Utilitario();
        public void CargarGriv(GridView gv, string buscar)
        {
            if (buscar == "")
            {
                string sql = "UDP_Mostrarrepa";
                DataSet ds = util.ObtenerDatos(sql, "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();

            }
            else
            {
                string sql = "UDP_BuscarReparacio'" + buscar + "'";
                DataSet ds = util.ObtenerDatos(sql, "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();
            }

        }




    }
}