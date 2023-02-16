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
                DataSet ds = util.ObtenerDatos("EXEC UDP_MostrarClientes", "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();

            }
            else
            {
                string sql = "EXEC UDP_BuscarClientes'" + buscar + "'";
                DataSet ds = util.ObtenerDatos(sql,"t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();
            }

        }
        public DataSet cargardatos(string id)
        {
            DataSet ds = new DataSet();
            string SQL = "EXEC UDP_ObtenerDatos_Cliente '" + int.Parse(id) + "'";
            ds = util.ObtenerDatos(SQL, "T");
            return ds;
        }






        public void DdlEstado(DropDownList ddl)
        {
            util.cargarDDL("Select EstadoCivil_ID,EstadoCivil_Descripcion from  [dbo].[tbl_EstadoCivil]", null, ddl);

        }

        public void ddldepto(DropDownList ddl)
        {
            util.cargarDDL("select [Departamento_ID],[Departamento_Descripcion] from [dbo].[tbl_Departamentos]", null, ddl);
        }

        public void ddlmuni(DropDownList ddl, string depto)
        {
            util.cargarDDL("select [Ciudad_Id],[Ciudad_Descripcion] from [dbo].[tbl_Ciudades] where [Ciudad_DepartamentoId] =" + depto, null, ddl);
        }






    }
}