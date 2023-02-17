using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SistemaReparaciónDePC.Clases
{
    public class RestablecerLogIn
    {
        CnxBD con = new CnxBD();
        public void EditarContraseña(string Usuario, string Contraseña)
        {
            SqlCommand cmd = new SqlCommand("EXEC UDP_RestablecerContraseña '" + Usuario + "', '" + Contraseña + "' ", con.ConectarCmd());
            cmd.ExecuteNonQuery();
        }
    }
}