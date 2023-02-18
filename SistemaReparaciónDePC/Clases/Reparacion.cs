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
        public DataSet cargardatos(string id)
        {
            DataSet ds = new DataSet();
            string SQL = "UDP_Obtener_Reparacio '" + int.Parse(id) + "'";
            ds = util.ObtenerDatos(SQL, "T");
            return ds;
        }
        public void DDLTipodetrabajo(DropDownList ddl)
        {
            util.cargarDDL("select [tipo_ID],[tipo_Descripción] from [dbo].[tbl_TipoDeTrabajo]", null, ddl);

        }

        public void DDLproducto(DropDownList ddl)
        {
            util.cargarDDL("select [pro_ID],[pro_Descripción]  from [dbo].[tbl_Producto] where Estado=1", null, ddl);
        }

        public void DDLcliente(DropDownList ddl)
        {
            util.cargarDDL("select [Cliente_Id],[Cliente_Nombre]  from [dbo].[tbl_Cliente] where Cliente_Estado=1",null,ddl);
        }
        public void DDempleado(DropDownList ddl)
        {
            util.cargarDDL("select [Empleado_Id],[Empleado_Nombre] from [dbo].[tbl_Empleados] where Empleado_Estado=1", null, ddl);
        }


    }
}