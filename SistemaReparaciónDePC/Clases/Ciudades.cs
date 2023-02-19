using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using SistemaReparaciónDePC.Clases;

namespace SistemaReparaciónDePC.Clases
{
    
    public class Ciudades
    {
        Utilitario util = new Utilitario();
        public void CargarGriv(GridView gv, string buscar)
        {

            if (buscar == "")
            {
                DataSet ds = util.ObtenerDatos("EXEC UDP_MostrarCiudades", "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();

            }
            else
            {
                string sql = "EXEC UDP_BuscarCiudades'" + buscar + "'";
                DataSet ds = util.ObtenerDatos(sql, "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();
            }

        }

        public DataSet cargardatos(string id)
        {
            DataSet ds = new DataSet();
            string SQL = "EXEC UDP_ObtenerDatos_Ciudad '" + int.Parse(id) + "'";
            ds = util.ObtenerDatos(SQL, "T");
            return ds;
        }

        public void ddldepto(DropDownList ddl)
        {
            util.cargarDDL("select [Departamento_ID],[Departamento_Descripcion] from [dbo].[tbl_Departamentos]", null, ddl);
        }
    }
}