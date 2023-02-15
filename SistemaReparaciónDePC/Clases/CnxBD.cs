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
        string con = @"data source =DESKTOP-QL1VPH4; initial catalog=BD_Reparaciones; user id=acampos; password=acampos ";
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