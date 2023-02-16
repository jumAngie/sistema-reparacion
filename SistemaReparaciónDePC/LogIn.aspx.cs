using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaReparaciónDePC.Clases;

namespace SistemaReparaciónDePC
{
    public partial class LogIn : System.Web.UI.Page
    {
        Utilitario util = new Utilitario();
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
                DataSet datas = util.ObtenerDatos("EXEC UDP_Login '"+Usuario+"', '"+Password+"'", "TL");

                if(datas.Tables["TL"].Rows.Count > 0)
                {
                    Session["Usuario"] = datas.Tables["TL"].Rows[0]["Usuario_Usuario"].ToString();
                    Session["Admin"] = datas.Tables["TL"].Rows[0]["Usuario_UsuarioAdmin"].ToString();
                    Session["ID"] = datas.Tables["TL"].Rows[0]["Usuario_UsuarioId"].ToString();
                    Response.Redirect("Home.aspx");
                }
            }
        }
    }
}