using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC.Clases
{
    public class Usuarios
    {
        Utilitario util = new Utilitario();
        CnxBD con = new CnxBD();
        public void cargarGrid(GridView gv, string buscar)
        {
            if (buscar == "")
            {
                DataSet ds = util.ObtenerDatos("UDP_MostrarUsuarios", "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();
            }
            else
            {
                string sql = "UDP_BuscarUsuarios '" + buscar + "'";
                DataSet ds = util.ObtenerDatos(sql, "t");
                gv.DataSource = ds.Tables["t"];
                gv.DataBind();
            }

        }

        public DataSet cargardatos(string id)
        {
            DataSet ds = new DataSet();
            string SQL = "UDP_ObtenerDatos_Usuarios '" + int.Parse(id) + "'";
            ds = util.ObtenerDatos(SQL, "T");
            return ds;
        }

        public void ddlEmpleado(DropDownList ddl)
        {
            util.cargarDDL("EXEC UDP_DDLEmpleados", null, ddl);

        }

        public void InsertarUsuarios(string Usuario, int Empleado, string Contraseña, int Admin, int Modi)
        {
            SqlCommand cmd = new SqlCommand("EXEC UDP_InsertarUsuarios '" + Usuario + "', " + Empleado + ", '" + Contraseña + "," + Modi + "," + Admin, con.ConectarCmd());
            cmd.ExecuteNonQuery();
        }
    }
}