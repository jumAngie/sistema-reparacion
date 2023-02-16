using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SistemaReparaciónDePC.Clases
{
    public class CnxBD
    {
        SqlConnection cnx = new SqlConnection();
        string con = @"data source =DESKTOP-TSV52PA\SQLEXPRESS; initial catalog=BD_Reparaciones; user id=JuanCenteno; password=juancenteno20 ";
        protected bool estado = false;

        public SqlConnection Obtenercnx()
        {
            cnx.ConnectionString = con;

            return cnx;
        }
        public SqlConnection ConectarCmd()
        {
            SqlConnection conec = new SqlConnection(con);
            conec.Open();
            estado = true;

            return conec;
        }
    }
}