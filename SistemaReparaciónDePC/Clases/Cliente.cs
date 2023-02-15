using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC.Clases
{
    public class Cliente
    {
        Utilitario util = new Utilitario();
       public void CargarGriv(GridView gv, string buscar)
        {
            if(buscar == "")
            {
                DataSet ds = util.ObtenerDatos("UDP_MostrarClientes", "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();

            }
            else
            {
                string sql = "UDP_BuscarClientes'" + buscar + "'";
                DataSet ds = util.ObtenerDatos(sql,"t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();
            }

        }
    
    
    }
}