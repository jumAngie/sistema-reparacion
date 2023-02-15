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
           
            con = @"Data Source =DESKTOP-TSV52PA\SQLEXPRESS; Initial catalog=BD_Reparaciones; user = JuanCenteno; password=juancenteno20 ";
            cnx.ConnectionString = con;
        }
        public SqlConnection Obtenercnx()
        {
            coneccion();
            return cnx;
        }









    }
}