using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC.Clases
{
    public class Utilitario
    {
        CnxBD cnx = new CnxBD();
        SqlConnection con = new SqlConnection();
         
        public DataSet ObtenerDatos (string sql, string tabla)
        {
            con = cnx.Obtenercnx();
            SqlDataAdapter da = new SqlDataAdapter(sql,con);
            DataSet ds = new DataSet();
            da.Fill(ds, tabla);
            con.Close();
            return ds;
        }   
        
        public void cargarDDL(string sql,string value, DropDownList ddl)
        {
            DataSet ds = ObtenerDatos(sql, "Tabla");
            ddl.DataValueField = ds.Tables["Tabla"].Columns[0].ColumnName;
            ddl.DataTextField = ds.Tables["Tabla"].Columns[1].ColumnName;
            ddl.DataSource = ds.Tables["Tabla"];


            if (value != null || value != "")
            {
                ddl.SelectedValue = value;
            }

            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Seleccione una opcion", "0"));

        }
       
    }
}