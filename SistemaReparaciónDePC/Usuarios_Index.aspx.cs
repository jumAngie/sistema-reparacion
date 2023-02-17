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
    public partial class Usuarios_Index : System.Web.UI.Page
    {
        Usuarios usu = new Usuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["IdUsuario_Editar"] = "";
                usu.cargarGrid(gvUsuarios, txtbuscar.Text);
            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "Editar")
                {
                    Session["IdUsuario_Editar"] = eventargument;
                    Response.Redirect("Usuarios_Admin.aspx");

                }

                if (eventtarget == "Eliminar")
                {
                    Session["IdUsuario_Editar"] = eventargument;
                    string usuariomodi = Session["ID"].ToString();
                    int UsuarioModi = Int32.Parse(usuariomodi);
                    usu.BorrarUsuario(eventargument, UsuarioModi);
                    usu.cargarGrid(gvUsuarios, txtbuscar.Text);

                }
            }
            
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            usu.cargarGrid(gvUsuarios, txtbuscar.Text);
        }

        protected void gvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsuarios.PageIndex = e.NewPageIndex;
            usu.cargarGrid(gvUsuarios, txtbuscar.Text);
        }

        protected void btnuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios_Admin.aspx");
        }
    }
}