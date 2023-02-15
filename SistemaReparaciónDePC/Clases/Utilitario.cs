using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

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
    }
}