using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using SistemaReparaciónDePC.Clases;

namespace SistemaReparaciónDePC.Clases
{
    public class Servicios
    {
        Utilitario util = new Utilitario();

        public void CargarGriv(GridView gv, string buscar)
        {
            if (buscar == "")
            {
                DataSet ds = util.ObtenerDatos("EXEC UDP_MostrarTipoDeTrabajo", "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();

            }
            else
            {
                string sql = "EXEC UDP_BuscarTipoDeTrabajo'" + buscar + "'";
                DataSet ds = util.ObtenerDatos(sql, "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();
            }

        }

        public DataSet cargardatos(string id)
        {
            DataSet ds = new DataSet();
            string SQL = "EXEC UDP_ObtenerDatos_TipoDeTrabajo'" + int.Parse(id) + "'";
            ds = util.ObtenerDatos(SQL, "T");
            return ds;
        }
    }
}