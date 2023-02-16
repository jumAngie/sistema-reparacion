using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string Usuario = txtUsu.Value;
            string Password = txtContra.Value;

            if (Usuario == "" || Password == "")
            {

            }
            else
            {

            }
        }
    }
}