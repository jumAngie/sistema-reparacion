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
        string con = "";
        public void coneccion ()
        {
           
            con = @"data source =DESKTOP-TSV52PA\SQLEXPRESS; initial catalog=BD_Reparaciones; user id=JuanCenteno; password=juancenteno20";
            cnx.ConnectionString = con;
        }
        public SqlConnection Obtenercnx()
        {
            coneccion();
            return cnx;
        }
    }
}